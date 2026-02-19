## Task 7: Error Handling and Debugging

These features help make scripts safer, more reliable, and easier to troubleshoot.

---

## 1. Exit Codes

Every command returns an exit code:
- `0` = success  
- Non-zero = failure  

### Check exit status:
```bash
ls /home
echo $?
Exit manually:
exit 0   # success
exit 1   # failure
Example:
#!/bin/bash

cp file1.txt /tmp/file1.txt
if [ $? -ne 0 ]; then
  echo "Copy failed"
  exit 1
fi
echo "Copy successful"





2. set -e (Exit on Error)
Script exits immediately if any command fails.

Example:
#!/bin/bash
set -e

cp file1.txt /tmp/file1.txt
rm /notexist   # script stops here
echo "This will not run"





3. set -u (Unset Variables as Error)
Treats undefined variables as an error.

Example:
#!/bin/bash
set -u

echo $USERNAME   # error if USERNAME is not set





4. set -o pipefail (Catch Errors in Pipes)
By default, only the last command’s status is returned in a pipeline.
pipefail returns failure if any command in the pipe fails.

Example:
#!/bin/bash
set -o pipefail

cat missing.txt | grep "error"
echo "Pipeline failed"





5. set -x (Debug Mode)
Prints each command before executing it (trace mode).

Example:
#!/bin/bash
set -x

echo "Start"
ls /tmp
echo "End"
Turn off debug mode:

set +x





6. Trap (Cleanup on Exit)
Run a command or function when script exits.

Syntax:
trap 'command' EXIT
Example:
#!/bin/bash

cleanup() {
  echo "Cleaning up temp files"
  rm -f /tmp/testfile.txt
}

trap cleanup EXIT

touch /tmp/testfile.txt
echo "Doing some work..."





7. Combine for Safe Scripts
Example:
#!/bin/bash
set -euo pipefail

cleanup() {
  echo "Script finished or failed"
}
trap cleanup EXIT

echo "Running safely..."
