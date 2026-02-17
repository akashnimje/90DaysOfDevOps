#!/bin/bash
set -euo pipefail

echo "Demo of strict mode"

# Undefined variable (set -u)
echo "Value of UNDEFINED_VAR is: $UNDEFINED_VAR"

# Command that fails (set -e)
ls /this_directory_does_not_exist

# Pipeline where one command fails (set -o pipefail)
cat /no_such_file.txt | grep "root"

echo "This line will NOT run"
