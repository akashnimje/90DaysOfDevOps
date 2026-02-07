🗂️ LVM (Logical Volume Manager) – Full Cheat Sheet
📌 What is LVM?

LVM (Logical Volume Manager) is a Linux storage management system that allows flexible disk management by creating:

Physical Volumes (PV) → Disks/partitions

Volume Groups (VG) → Pool of storage

Logical Volumes (LV) → Usable storage from VG

🧪 Check Current Storage
lsblk        # List block devices
df -h        # Show disk usage
pvs          # Show physical volumes
vgs          # Show volume groups
lvs          # Show logical volumes

🔹 Create Physical Volume (PV)
pvcreate /dev/sdb


Verify:

pvs
pvdisplay

🔹 Create Volume Group (VG)
vgcreate devops-vg /dev/sdb


Verify:

vgs
vgdisplay

🔹 Create Logical Volume (LV)
lvcreate -L 500M -n app-data devops-vg


Verify:

lvs
lvdisplay

🔹 Format Logical Volume
mkfs.ext4 /dev/devops-vg/app-data

🔹 Mount Logical Volume
mkdir -p /mnt/app-data
mount /dev/devops-vg/app-data /mnt/app-data


Verify:

df -h /mnt/app-data

🔹 Permanent Mount (fstab)
nano /etc/fstab


Add:

/dev/devops-vg/app-data   /mnt/app-data   ext4   defaults   0  0


Test:

mount -a

🔹 Extend Logical Volume
lvextend -L +200M /dev/devops-vg/app-data
resize2fs /dev/devops-vg/app-data


Verify:

df -h /mnt/app-data

🔹 Reduce Logical Volume (⚠ Risky)
umount /mnt/app-data
e2fsck -f /dev/devops-vg/app-data
resize2fs /dev/devops-vg/app-data 300M
lvreduce -L 300M /dev/devops-vg/app-data
mount /dev/devops-vg/app-data /mnt/app-data

🔹 Add New Disk to Existing VG
pvcreate /dev/sdc
vgextend devops-vg /dev/sdc
vgs

🔹 Remove Disk from VG
vgreduce devops-vg /dev/sdc
pvremove /dev/sdc

🧹 Delete LVM Setup
umount /mnt/app-data
lvremove /dev/devops-vg/app-data
vgremove devops-vg
pvremove /dev/sdb

🧠 Common Errors & Fixes
❌ Device not found
lsblk


✔ Check correct disk name

❌ Filesystem not resized
resize2fs /dev/devops-vg/app-data

❌ Mount failed
mkfs.ext4 /dev/devops-vg/app-data

📊 Useful Monitoring Commands
lsblk
blkid
mount | grep devops
df -Th

🧪 One-Command Lab (Quick Test)
pvcreate /dev/sdb
vgcreate devops-vg /dev/sdb
lvcreate -L 500M -n app-data devops-vg
mkfs.ext4 /dev/devops-vg/app-data
mkdir /mnt/app-data
mount /dev/devops-vg/app-data /mnt/app-data
