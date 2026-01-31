lDay-3
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

🔹 3. NETWORK TROUBLESHOOTING
Command	Use
ip a---------------------Show IP addresses
ip r---------------------Show routing table
ping google.com----------Check connectivity
traceroute google.com----Path to host
nslookup google.com------DNS lookup
dig google.com-----------DNS details
ss -tulnp----------------Open ports
netstat -tulnp-----------Legacy open ports
curl http://site---------Test URL
wget url-----------------Download file
tcpdump -i eth0----------Packet capture
nmcli dev status---------Network manager
hostname -I--------------Show IP
arp -a-------------------ARP table

🔹 4. LOG & SYSTEM TROUBLESHOOTING
Command	Use
dmesg--------------------Kernel messages
journalctl---------------System logs
journalctl -xe-----------Error logs
uptime-------------------Load
last---------------------Login history
who----------------------Logged-in users

🔹 5. COMMON COMBINATIONS (REAL ADMIN USE)
ps -ef | grep nginx
df -h | grep /dev
ss -tulnp | grep 80
tail -f /var/log/syslog
free -h && uptime




