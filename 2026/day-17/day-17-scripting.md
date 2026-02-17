Day 17 – Shell Scripting Cheat Sheet

Topics: Loops, Arguments, Package Installation & Error Handling

📌 Objectives

Learn for and while loops

Use command-line arguments

Automate package installation

Add basic error handling

Practice safe scripting

🟢 Task 1: For Loop
Script: for_loop.sh
#!/bin/bash

fruits=("Apple" "Banana" "Mango" "Orange" "Grapes")

for fruit in "${fruits[@]}"
do
  echo "Fruit: $fruit"
done


📤 Output:

Fruit: Apple
Fruit: Banana
Fruit: Mango
Fruit: Orange
Fruit: Grapes

Script: count.sh
#!/bin/bash

for i in {1..10}
do
  echo $i
done


📤 Output:

1
2
3
4
5
6
7
8
9
10

🟡 Task 2: While Loop
Script: countdown.sh
#!/bin/bash

read -p "Enter a number: " num

while [ $num -ge 0 ]
do
  echo $num
  num=$((num-1))
done

echo "Done!"


📤 Output:

Enter a number: 5
5
4
3
2
1
0
Done!

🔵 Task 3: Command-Line Arguments
Script: greet.sh
#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./greet.sh <name>"
else
  echo "Hello, $1!"
fi


📤 Output:

$ ./greet.sh Akash
Hello, Akash!

$ ./greet.sh
Usage: ./greet.sh <name>

Script: args_demo.sh
#!/bin/bash

echo "Script name: $0"
echo "Total arguments: $#"
echo "All arguments: $@"


📤 Output:

$ ./args_demo.sh one two three
Script name: ./args_demo.sh
Total arguments: 3
All arguments: one two three

🟠 Task 4: Install Packages via Script
Script: install_packages.sh
#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

packages=("nginx" "curl" "wget")

for pkg in "${packages[@]}"
do
  if dpkg -s $pkg &> /dev/null; then
    echo "$pkg is already installed"
  else
    echo "Installing $pkg..."
    apt install -y $pkg
  fi
done


📤 Output (example):

nginx is already installed
Installing curl...
Installing wget...

🔴 Task 5: Error Handling
Script: safe_script.sh
#!/bin/bash
set -e

mkdir /tmp/devops-test || echo "Directory already exists"
cd /tmp/devops-test || echo "Failed to enter directory"
touch demo.txt || echo "Failed to create file"

echo "Script completed successfully"


📤 Output:

Directory already exists
Script completed successfully
