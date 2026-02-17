Bash Scripting Cheat Sheet

Topics Covered:
✔ Functions
✔ Return values
✔ Strict mode (set -euo pipefail)
✔ Local vs Global variables
✔ System Info Reporter script

✅ Task 1: Basic Functions
📄 functions.sh
#!/bin/bash

greet() {
    echo "Hello, $1!"
}

add() {
    echo "Sum is: $(( $1 + $2 ))"
}

greet "Akash"
add 10 20

▶ Output
Hello, Akash!
Sum is: 30

✅ Task 2: Functions with Return Values
📄 disk_check.sh
#!/bin/bash

check_disk() {
    echo "Disk Usage:"
    df -h /
}

check_memory() {
    echo "Memory Usage:"
    free -h
}

check_disk
check_memory

▶ Output
Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda1       20G  5G   14G   28% /

Memory Usage:
              total   used   free
Mem:           2G     400M   1.2G

✅ Task 3: Strict Mode (set -euo pipefail)
📄 strict_demo.sh
#!/bin/bash
set -euo pipefail

echo "Value: $UNDEFINED_VAR"
ls /no_such_dir
cat /no_file | grep root

▶ Output (errors)
unbound variable: UNDEFINED_VAR


OR

ls: cannot access '/no_such_dir': No such file

🔍 Meaning
Option	Purpose
-e	Exit if command fails
-u	Exit if variable undefined
pipefail	Exit if any pipe command fails
✅ Task 4: Local Variables
📄 local_demo.sh
#!/bin/bash

local_func() {
    local msg="LOCAL variable"
    echo "Inside function: $msg"
}

global_func() {
    msg="GLOBAL variable"
    echo "Inside function: $msg"
}

echo "Before: $msg"

local_func
echo "After local_func: $msg"

global_func
echo "After global_func: $msg"

▶ Output
Before:

Inside function: LOCAL variable
After local_func:

Inside function: GLOBAL variable
After global_func: GLOBAL variable

🧠 Key Point

✔ local → visible only inside function
❌ normal variable → becomes global

✅ Task 5: System Info Reporter Script
📄 system_info.sh
#!/bin/bash
set -euo pipefail

host_os_info() {
    echo "Hostname: $(hostname)"
    grep PRETTY_NAME /etc/os-release
}

uptime_info() {
    uptime -p
}

disk_usage() {
    df -h | sort -k2 -h | tail -5
}

memory_usage() {
    free -h
}

cpu_processes() {
    ps -eo pid,comm,%cpu --sort=-%cpu | head -6
}

main() {
    echo "===== SYSTEM INFO REPORT ====="

    echo "--- Host & OS ---"
    host_os_info

    echo "--- Uptime ---"
    uptime_info

    echo "--- Disk Usage ---"
    disk_usage

    echo "--- Memory ---"
    memory_usage

    echo "--- Top CPU Processes ---"
    cpu_processes
}

main

▶ Output (format)
===== SYSTEM INFO REPORT =====
--- Host & OS ---
Hostname: ubuntu-server
PRETTY_NAME="Ubuntu 22.04 LTS"

--- Uptime ---
up 2 hours, 15 minutes

--- Disk Usage ---
/dev/xvda1  20G  5G  14G  28%

--- Memory ---
Mem: 2G used 400M free 1.2G

--- Top CPU Processes ---
PID  COMMAND   %CPU
123  java      15.2
456  python    10.1

🧠 Summary (One-Look Revision)
Concept	Learned
Functions	Code reuse
Return values	Capture output
Strict mode	Safer scripts
Local variables	No leakage
System script	Real monitoring
