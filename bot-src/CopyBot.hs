{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE TypeApplications #-}

module CopyBot (copyBot) where

import DA.Ledger as Ledger hiding (filter)
import Bot
import Contracts
import Domain
import Logging
import RuleBot
import DA.Ledger.IsLedgerValue (IsLedgerValue(..))
import DA.Ledger.Types
import Control.Monad (guard)
import qualified Data.Map as Map
import Data.Maybe
import qualified Data.List as List
import Data.List (sort)
import qualified Data.Set as Set

copyBot
    :: Logger
    -> PackageId
    -> TimeSettings
    -> BotContext
    -> IO ()
copyBot log pid ts bc =
    simpleRuleNanobot log ts bc copyUpd (copyRule pid bc) (copyRecov pid bc) ()

copyUpd :: StateUpdate () ()
copyUpd _ _ = ()

copyRecov :: PackageId -> BotContext -> Recovery () ()
copyRecov pid bc bs _ _ _ = updateCopies pid bc bs

copyRule :: PackageId -> BotContext -> Rule () ()
copyRule pid bc bs _ = updateCopies pid bc bs

updateCopies :: PackageId -> BotContext -> BotState () () -> [((), [Command], PendingSet)]
updateCopies pid BotContext{party} BotState{acs} = cmds
    where
        accountTId = getTid pid "Account"
        expenseTid = getTid pid "Expense"
        approvalTid = getTid pid "ExpenseApproval"

        expenses :: [(ContractId, Expense)]
        expenses = getRecords @Expense expenseTid acs
        approvals :: [(ContractId, ExpenseApproval)]
        approvals = getRecords @ExpenseApproval approvalTid acs

        settleCmds = map (settleCommand accountTId expenseTid approvalTid) $ match expenses approvals

        cmds = settleCmds

getRecords :: forall t. IsLedgerValue t => TemplateId -> ACS () -> [(ContractId, t)]
getRecords tid acs = map (\(cid, rec) -> (cid, fromJust $ fromRecord rec)) $ maybe [] (Map.toList . contracts) mtacs
    where
        mtacs = Map.lookup tid (templateACSs acs)

match :: [(ContractId, Expense)] -> [(ContractId, ExpenseApproval)] -> [(Expense, ContractId, [ContractId])]
match expenses approvals = do
    (expenseCid, expense@Expense{payer, beneficiaries}) <- expenses
    let expenseApprovals = filter (\(_, ExpenseApproval{expense}) -> expense == expenseCid) approvals
    guard $ sort beneficiaries == sort (payer : (map (beneficiary . snd) expenseApprovals))
    pure (expense, expenseCid, map fst expenseApprovals)

settleCommand :: TemplateId -> TemplateId -> TemplateId -> (Expense, ContractId, [ContractId]) -> ((), [Command], PendingSet)
settleCommand accountTId expenseTid approvalTid (Expense{payer, account}, expenseCid, approvalCids) =
    let arg = VRecord $ Record Nothing [RecordField "" $ toValue payer, RecordField "" $ toValue expenseCid, RecordField "" $ toValue approvalCids]
        cmd = ExerciseByKeyCommand accountTId account (Choice "SettleExpense") arg
        pending = Map.fromList
            [ (expenseTid, Set.singleton expenseCid)
            , (approvalTid, Set.fromList approvalCids)
            ]

    in
    ((), [cmd], pending)
