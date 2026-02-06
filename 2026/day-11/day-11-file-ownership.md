# Day 11 – File Ownership Challenge (chown & chgrp)

## 🎯 Objective
Master file and directory ownership in Linux by practicing:
- Understanding owner and group
- Using `chown` and `chgrp`
- Changing ownership recursively
- Applying different ownerships to files

## 🧠 Task 1: Understanding Ownership

### Command Used:

$ls -l
-rw-r--r-- 1 owner group size date filename

Explanation:
Owner → User who owns the file
Group → Group associated with the file
Permissions → Define what owner, group, and others can do

📌 Difference between Owner and Group:

The owner is the main user who controls the file.
The group allows multiple users to share access based on group membership.

🔧 Task 2: Basic chown Operations
Create file:
touch devops-file.txt

Check owner:
ls -l devops-file.txt

Change owner:
sudo chown tokyo devops-file.txt
sudo chown berlin devops-file.txt

Verify:
ls -l devops-file.txt

Task 3: Basic chgrp Operations
Create file:
touch team-notes.txt

Create group:
sudo groupadd heist-team

Change group:
sudo chgrp heist-team team-notes.txt

Verify:
ls -l team-notes.txt

Task 4: Change Owner & Group Together
Create file:
touch project-config.yaml

Change owner and group:
sudo chown professor:heist-team project-config.yaml

Create directory:
mkdir app-logs

Change ownership:
sudo chown berlin:heist-team app-logs

🔁 Task 5: Recursive Ownership
Create structure:
mkdir -p heist-project/vault
mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf

Create group:
sudo groupadd planners

Change ownership recursively:
sudo chown -R professor:planners heist-project/

Verify:
ls -lR heist-project/

🏆 Task 6: Practice Challenge
Create users:
sudo useradd tokyo
sudo useradd berlin
sudo useradd nairobi

Create groups:
sudo groupadd vault-team
sudo groupadd tech-team

Create directory & files:
mkdir bank-heist
touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt

Assign ownership:
sudo chown tokyo:vault-team bank-heist/access-codes.txt
sudo chown berlin:tech-team bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt

Verify:
ls -l bank-heist/




📚 Key Commands Reference
# View ownership
ls -l filename

# Change owner only
sudo chown newowner filename

# Change group only
sudo chgrp newgroup filename

# Change both owner and group
sudo chown owner:group filename

# Recursive ownership
sudo chown -R owner:group directory/

# Change only group with chown
sudo chown :groupname filename







