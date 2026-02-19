# Shell Scripting Cheat Sheet 🐧
## Day 21 – Build Your Own Reference Guide

This cheat sheet is a quick reference for common Shell scripting concepts with short explanations and examples.

---

## 1. Shebang (#!/bin/bash)

### What it does:
The shebang tells the system which interpreter to use to run the script.

### Why it matters:
Without it, the system may not know how to execute the script properly.

### Example:
```bash
#!/bin/bash
echo "Hello, World!"


2. Running a Script
Step 1: Make script executable
chmod +x script.sh
Step 2: Run the script
./script.sh
Alternative (without execute permission):
bash script.sh


3. Comments
Single-line comment:
# This is a comment
echo "Hello"
Inline comment:
echo "Hello"  # This prints Hello


4. Variables
Declaring a variable:
NAME="Akash"
No spaces around =

Using a variable:
echo $NAME
Quoting variables:
Double quotes (allows variable expansion):

echo "$NAME"
Single quotes (no variable expansion):

echo '$NAME'


5. Reading User Input
Using read:
echo "Enter your name:"
read USERNAME
echo "Hello $USERNAME"
In one line:
read -p "Enter your age: " AGE
echo "Your age is $AGE"


6. Command-Line Arguments
Symbol	Meaning
$0	Script name
$1	First argument
$2	Second argument
$#	Total number of arguments
$@	All arguments
$?	Exit status of last command
Example:
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Total arguments: $#"
echo "All arguments: $@"
Run:
./script.sh DevOps Linux
Output:
Script name: ./script.sh
First argument: DevOps
Total arguments: 2
All arguments: DevOps Linux
