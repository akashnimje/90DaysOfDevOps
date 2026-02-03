🐧 Day 06 – Linux Fundamentals
📂 Topic: Read and Write Text Files
🎯 Objective

Practice basic file input/output operations using standard Linux commands.

📁 Files Created
File Name	Purpose
notes.txt	Store sample text content
file-io-practice.md	Practice documentation
🧪 Commands Executed & Purpose
Command	Description
touch notes.txt	Created an empty file
echo "Line 1" > notes.txt	Wrote text using output redirection
echo "Line 2" >> notes.txt	Appended text to the file
echo "Line 3" | tee -a notes.txt	Displayed output and appended it simultaneously
cat notes.txt	Displayed full file content
head -n 2 notes.txt	Displayed first two lines
tail -n 2 notes.txt	Displayed last two lines
📘 Key Learning

File read and write operations are fundamental in Linux and are heavily used for:
✔ Log file management
✔ Configuration file editing
✔ Automation scripts
✔ DevOps workflows
