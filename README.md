# ZAMLive

## Getting started

1. Install React and friends: `yarn install`
1. Start Sandbox: `./scripts/sandbox.sh`
1. Start Navigator: `./scripts/navigator.sh`
1. Start HTTP-JSON server: `./scripts/http-json.sh`
1. Start Web-UI server: `yarn start`
1. Open [Navigator](http://localhost:7500/), login as `Martin` (it is important to use `Martin` due to restrictions in the UI) and create an `AccountProposal` with `[Martin]` as `members` and `[Remy]` as `pendingMembers`. Choosse some nice name, too.
1. Open [Navigator](http://localhost:7500/) again, login as `Remy` and `Accept` the `AccountProposal` created in the previous step with `Remy` as the `acceptingMember`.
1. Open the [UI](http://localhost:3000/), click on the account you previously created, click on `Add expense`, write a nice description of your expense and the amount of money you spent on it. Click on `Submit` and wait for confirmation that your submission was successful.
1. Go back to [Navigator](http://localhost:7500/contracts/) and verify that the newly created expense shows up as an active contract.


## Logins

- Martin: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiTWFydGluIn0.uYdP2MNhOcw-zYF-_tOxZygqQldhRBgX0rCTfUgZ4A4`
- Oliver: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiT2xpdmVyIn0.tPigA2xMyJ5qpQ8_4_MfBb34vXnR2IMBVhYTUyU6g9A`
- Remy: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsZWRnZXJJZCI6InphbWxpdmUiLCJhcHBsaWNhdGlvbklkIjoiemFtbGl2ZSIsInBhcnR5IjoiUmVteSJ9.X9Xo99Oot514xHftcWHhsX2eGEG_x7pe5uSTO4m3jCo`
