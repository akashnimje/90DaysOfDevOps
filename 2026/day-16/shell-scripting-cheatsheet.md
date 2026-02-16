# 🐧 Shell Scripting Basics – GitHub Cheat Sheet (Day 16)

This cheat sheet covers the fundamentals of Bash shell scripting:
- Shebang usage
- Variables and quoting
- User input
- Conditional logic (if-else)
- File and service checks

---

## ✅ Task 1: Your First Script (hello.sh)

### Create file
```bash
touch hello.sh
Add content
#!/bin/bash
echo "Hello, DevOps!"
Make it executable
chmod +x hello.sh
Run the script
./hello.sh
Output
Hello, DevOps!
📌 What happens if you remove the shebang?
If file contains:

echo "Hello, DevOps!"
Run:

./hello.sh
You may get:

command not found
Without #!/bin/bash, the system does not know which interpreter to use.
You must run:

bash hello.sh
✅ Task 2: Variables (variables.sh)
Create file
touch variables.sh
Add content
#!/bin/bash

NAME="Akash"
ROLE="DevOps Engineer"

echo "Hello, I am $NAME and I am a $ROLE"
Make it executable
chmod +x variables.sh
Run
./variables.sh
Output
Hello, I am Akash and I am a DevOps Engineer
Single quotes vs Double quotes
echo 'Hello, I am $NAME'
echo "Hello, I am $NAME"
Output:

Hello, I am $NAME
Hello, I am Akash
Single quotes → no variable expansion
Double quotes → variable expansion

✅ Task 3: User Input (greet.sh)
Create file
touch greet.sh
Add content
#!/bin/bash

read -p "Enter your name: " NAME
read -p "Enter your favourite tool: " TOOL

echo "Hello $NAME, your favourite tool is $TOOL"
Make it executable
chmod +x greet.sh
Run
./greet.sh
Sample Output:

Enter your name: Akash
Enter your favourite tool: Docker
Hello Akash, your favourite tool is Docker
✅ Task 4: If-Else Conditions
Number Check (check_number.sh)
Create file:

touch check_number.sh
Add content:

#!/bin/bash

read -p "Enter a number: " NUM

if [ $NUM -gt 0 ]; then
  echo "Number is positive"
elif [ $NUM -lt 0 ]; then
  echo "Number is negative"
else
  echo "Number is zero"
fi
Run:

chmod +x check_number.sh
./check_number.sh
Output:

Enter a number: 5
Number is positive
File Check (file_check.sh)
Create file:

touch file_check.sh
Add content:

#!/bin/bash

read -p "Enter filename: " FILE

if [ -f "$FILE" ]; then
  echo "File exists"
else
  echo "File does not exist"
fi
Run:

chmod +x file_check.sh
./file_check.sh
Output:

Enter filename: hello.sh
File exists
✅ Task 5: Combine All (server_check.sh)
Create file:

touch server_check.sh
Add content:

#!/bin/bash

SERVICE="nginx"

read -p "Do you want to check the status of $SERVICE? (y/n): " CHOICE

if [ "$CHOICE" = "y" ]; then
  systemctl status $SERVICE
elif [ "$CHOICE" = "n" ]; then
  echo "Skipped."
else
  echo "Invalid choice"
fi
Run:

chmod +x server_check.sh
./server_check.sh
Sample Output:

Do you want to check the status of nginx? (y/n): y
Output:● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; preset: ena
     Active: active (running) since Mon 2026-02-16 13:39:01 UTC; 8min ago
       Docs: man:nginx(8)
    Process: 2865 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_proces
    Process: 2867 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (co
   Main PID: 2895 (nginx)
      Tasks: 2 (limit: 517)
     Memory: 1.8M (peak: 4.1M)
        CPU: 19ms
     CGroup: /system.slice/nginx.service
             ├─2895 "nginx: master process /usr/sbin/nginx -g daemon on; master_
             └─2897 "nginx: worker process"



**Key Takeaways**

Shebang (#!/bin/bash) defines the interpreter.

Variables and read make scripts dynamic.

if-else enables automation logic.
