📄 Day 10 – File Permissions & File Operations Challenge
🎯 Objective

Master file permissions and basic file operations in Linux.

You will practice:

Creating files using touch, cat, vim

Reading files using cat, head, tail

Understanding Linux permission format

Modifying permissions using chmod

Testing permission behavior

📝 Task 1: Create Files
✅ Commands Used
touch devops.txt
echo "Linux File Permissions Notes" > notes.txt
vim script.sh

✍️ Content of script.sh
echo "Hello DevOps"

🔍 Verify Permissions
ls -l

📤 Sample Output
-rw-r--r-- 1 user user   0 devops.txt
-rw-r--r-- 1 user user  30 notes.txt
-rw-r--r-- 1 user user  20 script.sh


📌 Explanation:

- → file

rw- → owner can read & write

r-- → group can read

r-- → others can read

📖 Task 2: Read Files
✅ Commands Used
cat notes.txt
vim -R script.sh
head -5 /etc/passwd
tail -5 /etc/passwd

📤 Sample Output
Linux File Permissions Notes

root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
...


📌 Important:

vim -R → opens file in read-only mode

head → shows first lines

tail → shows last lines

🔐 Task 3: Understand Permissions
Permission Format
rwxrwxrwx
│ │ │
│ │ └── Others
│ └──── Group
└────── Owner

Permission Values
Symbol	Meaning	Value
r	read	4
w	write	2
x	execute	1
🔍 Check Permissions
ls -l devops.txt notes.txt script.sh

✍️ Observations
File	Permissions	Owner	Group	Others
devops.txt	rw-r--r--	Read/Write	Read	Read
notes.txt	rw-r--r--	Read/Write	Read	Read
script.sh	rw-r--r--	Read/Write	Read	Read

📌 Meaning of rw-r--r-- (644):

Owner = read + write (4+2 = 6)

Group = read (4)

Others = read (4)

⚙️ Task 4: Modify Permissions
✅ Make script executable
chmod +x script.sh
./script.sh

📤 Output
Hello DevOps

✅ Set devops.txt to read-only
chmod 444 devops.txt

✅ Set notes.txt to 640
chmod 640 notes.txt

✅ Create directory with 755 permissions
mkdir project
chmod 755 project

🔍 Verify Changes
ls -l

📤 Sample Output
-r--r--r-- 1 user user devops.txt
-rw-r----- 1 user user notes.txt
-rwxr-xr-x 1 user user script.sh
drwxr-xr-x 2 user user project

🧪 Task 5: Test Permissions
❌ Try writing to read-only file
echo "test" >> devops.txt

📤 Output
Permission denied

❌ Try executing file without execute permission
chmod -x script.sh
./script.sh

📤 Output
Permission denied

📘 Important Concepts
🔹 Numeric Permission Examples
Permission	Meaning
777	rwxrwxrwx
755	rwxr-xr-x
644	rw-r--r--
640	rw-r-----
444	r--r--r--
🔹 File vs Directory Permissions

File

r → read file

w → modify file

x → execute file

Directory

r → list files

w → create/delete files

x → enter directory

✅ Learning Outcomes

Understood Linux permission structure (rwx)

Practiced chmod with numeric & symbolic modes

Learned how permissions affect file execution and editing

Gained hands-on experience with real Linux file operations

📌 Conclusion

File permissions are a critical part of Linux security.
This challenge helped build practical understanding of:

Who can read, write, and execute files

How to control access using chmod

How Linux enforces security at file level
