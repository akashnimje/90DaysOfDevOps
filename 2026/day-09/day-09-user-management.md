🐧 Day 09 – Linux User & Group Management Challenge
📌 Objective

Practice Linux user and group management by performing real system administration tasks:

Create users and groups

Assign users to groups

Configure shared directories with group permissions

Verify using system files and commands

📂 Expected Output

day-09-user-management.md (this file)

Screenshots of command outputs

List of commands used

🧪 Task 1: Create Users
🎯 Requirement

Create three users with home directories and passwords:

tokyo

berlin

professor

✅ Commands
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor

sudo passwd tokyo
sudo passwd berlin
sudo passwd professor

🔍 Verification
cat /etc/passwd | grep -E "tokyo|berlin|professor"
ls /home

🧪 Task 2: Create Groups
🎯 Requirement

Create two groups:

developers

admins

✅ Commands
sudo groupadd developers
sudo groupadd admins

🔍 Verification
cat /etc/group | grep -E "developers|admins"

🧪 Task 3: Assign Users to Groups
🎯 Requirement
User	Groups Assigned
tokyo	developers
berlin	developers, admins
professor	admins
✅ Commands
sudo usermod -aG developers tokyo
sudo usermod -aG developers,admins berlin
sudo usermod -aG admins professor

🔍 Verification
groups tokyo
groups berlin
groups professor

🧪 Task 4: Shared Directory for Developers
🎯 Requirement

Create /opt/dev-project

Group owner → developers

Permissions → 775

Test file creation as tokyo and berlin

✅ Commands
sudo mkdir /opt/dev-project
sudo chown :developers /opt/dev-project
sudo chmod 775 /opt/dev-project

🔍 Verification
ls -ld /opt/dev-project

🧪 Test Access
su - tokyo
touch /opt/dev-project/tokyo.txt
exit

su - berlin
touch /opt/dev-project/berlin.txt
exit

🧪 Task 5: Team Workspace
🎯 Requirement

Create user nairobi

Create group project-team

Add nairobi and tokyo to project-team

Create /opt/team-workspace

Set group ownership and permissions 775

Test file creation as nairobi

✅ Commands
sudo useradd -m nairobi
sudo passwd nairobi

sudo groupadd project-team
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo

sudo mkdir /opt/team-workspace
sudo chown :project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace

🔍 Verification
groups nairobi
groups tokyo
ls -ld /opt/team-workspace

🧪 Test Access
su - nairobi
touch /opt/team-workspace/nairobi.txt
exit

📜 List of Commands Used
useradd
passwd
groupadd
usermod
groups
cat /etc/passwd
cat /etc/group
mkdir
chown
chmod
ls -ld
touch
su

🏁 Conclusion

This challenge helped reinforce:

Linux user & group management

Permission handling using chmod and chown

Real-world shared directory setup

Verification using system files and commands

✔️ Hands-on practice for Linux Administration & DevOps fundamentals
