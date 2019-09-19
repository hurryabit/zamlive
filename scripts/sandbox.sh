#!/bin/bash
set -euxo pipefail

daml build

daml sandbox --wall-clock-time --ledgerid zamlive .daml/dist/zamlive-0.0.1.dar
# daml sandbox --ledgerid zamlive --scenario Main:setup .daml/dist/zamlive-0.0.1.dar
