-- Copyright (c) 2019 Digital Asset (Switzerland) GmbH and/or its affiliates. All rights reserved.
-- SPDX-License-Identifier: Apache-2.0

module DA.Ledger.App.MasterCopy.MCLedger (Handle(..), connect, run) where

import DA.Ledger as Ledger
import DA.Ledger.App.MasterCopy.Contracts (MCContract)
import DA.Ledger.App.MasterCopy.Logging (Logger)
import Data.Maybe (maybeToList, isJust, catMaybes)
import Data.List (find)
import Data.Text (pack)

data Handle = Handle {
    log :: Logger,
    lid :: LedgerId,
    pid :: PackageId
    }

port :: Port
port = 6865 -- port on which we expect to find a ledger. should be a command line option

damlStdlibPid, damlPrimPid :: PackageId
damlStdlibPid = PackageId "43c0bd62fa971cae4ca594943affed18a5997f7d7bb8b4b3440174756d4e4a82"
damlPrimPid = PackageId "a8656700a54dc21d902652b4dc39d08569485891c2ffa9e0a551549470d1e9be"

run :: TimeoutSeconds -> LedgerService a -> IO a
run timeout ls  = runLedgerService ls timeout (configOfPort port)

connect :: Logger -> IO Handle
connect log = do
    lid <- run 5 getLedgerIdentity
    pids <- run 5 $ listPackages lid
    Just pid <- pure $ find (`notElem` [damlStdlibPid, damlPrimPid]) pids
    log $ "Package ID: " ++ show pid
    return Handle{log,lid,pid}
