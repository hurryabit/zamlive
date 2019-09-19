-- Copyright (c) 2019 Digital Asset (Switzerland) GmbH and/or its affiliates. All rights reserved.
-- SPDX-License-Identifier: Apache-2.0

module Domain (
    Party(..),
    Master(..),
    Copy(..),
    Subscriber(..),
    Token(..),
    Expense(..),
    ExpenseApproval(..),
    ) where

import DA.Ledger.IsLedgerValue (IsLedgerValue(..))
import DA.Ledger.Types (ContractId(..),Party(..),Value(..))
import Data.Text.Lazy (Text)

data Master = Master { owner :: Party, name :: Text, info :: Text }
    deriving (Show, Eq, Ord)

instance IsLedgerValue Master where
    toValue Master{owner, name, info} = VList [toValue owner, toValue name, toValue info]
    fromValue = \case
        VList [v1,v2, v3] -> do
            owner <- fromValue v1
            name <- fromValue v2
            info <- fromValue v3
            return Master{owner, name, info}
        _ -> Nothing

data Copy = Copy { master :: Master, obs :: Party }
    deriving (Show, Eq, Ord)

instance IsLedgerValue Copy where
    toValue Copy{master, obs} = VList [VRecord $ toRecord master, toValue obs]
    fromValue = \case
        VList [VRecord r,v2] -> do
            master <- fromRecord r
            obs <- fromValue v2
            return Copy{master, obs}
        _ -> Nothing

data Subscriber = Subscriber { owner :: Party, obs :: Party }
    deriving (Show, Eq, Ord)

instance IsLedgerValue Subscriber where
    toValue Subscriber{owner, obs} = VList [toValue owner, toValue obs]
    fromValue = \case
        VList [v1,v2] -> do
            owner <- fromValue v1
            obs <- fromValue v2
            return Subscriber{owner, obs}
        _ -> Nothing

data Token = Token{owner :: Party}
    deriving (Eq, Show)

instance IsLedgerValue Token where
    toValue Token{owner} = VList [toValue owner]
    fromValue = \case
        VList [v] -> Token <$> fromValue v
        _ -> Nothing

data Expense = Expense
    { payer :: Party
    , beneficiaries :: [Party]
    , amount :: Value
    , account :: Value
    }
    deriving (Eq, Show)

instance IsLedgerValue Expense where
    toValue Expense{payer, beneficiaries, amount, account} = 
      VList [toValue payer, toValue beneficiaries, amount, account]
    fromValue = \case
        VList [v1, v2, v3, v4] -> Expense <$> fromValue v1 <*> fromValue v2 <*> Just v3 <*> Just v4
        _ -> Nothing

data ExpenseApproval = ExpenseApproval
    { payer :: Party
    , beneficiary :: Party
    , expense :: ContractId
    }
    deriving (Eq, Show)

instance IsLedgerValue ExpenseApproval where
    toValue ExpenseApproval{payer, beneficiary, expense} = VList [toValue payer, toValue beneficiary, toValue expense]
    fromValue = \case
        VList [v1, v2, v3] -> ExpenseApproval <$> fromValue v1 <*> fromValue v2 <*> fromValue v3
        _ -> Nothing
