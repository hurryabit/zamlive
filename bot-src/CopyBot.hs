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
        expenseTid = getTid pid "Expense"
        approvalTid = getTid pid "Approval"

        expenses :: [(ContractId, Expense)]
        expenses = getRecords @Expense expenseTid acs
        approvals :: [(ContractId, Approval)]
        approvals = getRecords @Approval approvalTid acs

        settleCmds = map (uncurry $ settleCommand expenseTid approvalTid) $ match expenses approvals

        cmds = settleCmds

getRecords :: forall t. IsLedgerValue t => TemplateId -> ACS () -> [(ContractId, t)]
getRecords tid acs = map (\(cid, rec) -> (cid, fromJust $ fromRecord rec)) $ maybe [] (Map.toList . contracts) mtacs
    where
        mtacs = Map.lookup tid (templateACSs acs)

match :: [(ContractId, Expense)] -> [(ContractId, Approval)] -> [(ContractId, [ContractId])]
match expenses approvals = do
    (expenseCid, Expense{beneficiaries}) <- expenses
    let expenseApprovals = filter (\(_, Approval{expense}) -> expense == expenseCid) approvals
    guard $ sort beneficiaries == sort (map (beneficiary . snd) expenseApprovals)
    pure (expenseCid, map fst expenseApprovals)

settleCommand :: TemplateId -> TemplateId -> ContractId -> [ContractId] -> ((), [Command], PendingSet)
settleCommand expenseTid approvalTid expenseCid approvalCids =
    let arg = VRecord $ Record Nothing [RecordField "" $ toValue approvalCids]
        cmd = ExerciseCommand expenseTid expenseCid (Choice "Settle") arg
        pending = Map.fromList
            [ (expenseTid, Set.singleton expenseCid)
            , (approvalTid, Set.fromList approvalCids)
            ]

    in
    ((), [cmd], pending)
