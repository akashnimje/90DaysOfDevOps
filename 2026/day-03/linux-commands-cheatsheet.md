Day-3
LINUX COMMAND CHEAT SHEET
Command	Use

🔹 1. PROCESS MANAGEMENT
ps -ef	-----------------Show all running processes
ps aux	-----------------Detailed process list
top	---------------------Live process monitor
htop	-------------------Better top (if installed)
uptime	-----------------System load & running time
whoami	-----------------Current user
kill PID-----------------Kill process by PID
kill -9 PID--------------Force kill
pkill process_name-------Kill by name
pgrep process_name-------Get PID of process
nice -n 10 command-------Start process with priority
renice -n -5 PID---------Change running process priority
free -h------------------Memory usage
vmstat-------------------CPU/memory stats

🔹 2. FILE SYSTEM COMMANDS
#(Navigation Command)
pwd----------------------Current directory
ls -l--------------------List files (long format)
ls -a--------------------Show hidden files
cd /path-----------------Change directory
tree---------------------Directory tree view

#(File Operations Command Use)
touch file.txt	---------Create file
cp file1 file2	---------Copy file
cp -r dir1 dir2	---------Copy directory
mv old new	---------Rename/move
rm file	-----------------Delete file
rm -rf dir	---------Force delete directory
cat file	---------View file
less file	---------Page view
head file	---------First 10 lines
tail file	---------Last 10 lines
tail -f logfile	---------Live log view

🔹 3. Network Management
•	ip a — Show IP address and other information for all active interfaces
•	ip addr — Display IP address details of network interfaces (same as ip a)
•	ip r — Show IP address of default gateway
•	cat /etc/resolv.conf — See what DNS servers your system is configured to use
•	ping — Send a ping request to a network device
•	traceroute — Trace the network path taken to a device
•	ssh — Login to a remote device with SSH
•	dig — Query DNS servers for detailed information about hostnames and records
•	curl — Transfer data from or to a server using supported protocols (HTTP, FTP, etc.)




