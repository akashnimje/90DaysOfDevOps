🛠️ Day 19 – Shell Scripting Project: Log Rotation, Backup & Crontab
📌 Objective

Apply shell scripting concepts (loops, arguments, error handling, automation) in real-world tasks:

Log rotation

Server backup

Scheduling using cron

Combined maintenance script

✅ Task 1: Log Rotation Script
📄 Script: log_rotate.sh
#!/bin/bash

LOG_DIR=$1

if [ -z "$LOG_DIR" ]; then
  echo "Usage: $0 <log_directory>"
  exit 1
fi

if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory does not exist."
  exit 1
fi

COMPRESSED_COUNT=$(find "$LOG_DIR" -name "*.log" -mtime +7 | wc -l)
DELETED_COUNT=$(find "$LOG_DIR" -name "*.gz" -mtime +30 | wc -l)

# Compress .log files older than 7 days
find "$LOG_DIR" -name "*.log" -mtime +7 -exec gzip {} \;

# Delete .gz files older than 30 days
find "$LOG_DIR" -name "*.gz" -mtime +30 -exec rm {} \;

echo "Log rotation completed."
echo "Files compressed: $COMPRESSED_COUNT"
echo "Files deleted: $DELETED_COUNT"

▶️ Usage
chmod +x log_rotate.sh
./log_rotate.sh /var/log/myapp

✅ Task 2: Server Backup Script
📄 Script: backup.sh
#!/bin/bash

SRC_DIR=$1
DEST_DIR=$2
DATE=$(date +%Y-%m-%d)
ARCHIVE_NAME="backup-$DATE.tar.gz"

if [ -z "$SRC_DIR" ] || [ -z "$DEST_DIR" ]; then
  echo "Usage: $0 <source_directory> <backup_destination>"
  exit 1
fi

if [ ! -d "$SRC_DIR" ]; then
  echo "Error: Source directory does not exist."
  exit 1
fi

mkdir -p "$DEST_DIR"

tar -czf "$DEST_DIR/$ARCHIVE_NAME" "$SRC_DIR"

if [ $? -ne 0 ]; then
  echo "Backup failed."
  exit 1
fi

SIZE=$(du -h "$DEST_DIR/$ARCHIVE_NAME" | cut -f1)
echo "Backup created: $ARCHIVE_NAME"
echo "Size: $SIZE"

# Delete backups older than 14 days
find "$DEST_DIR" -name "backup-*.tar.gz" -mtime +14 -exec rm {} \;

▶️ Usage
chmod +x backup.sh
./backup.sh /home/ubuntu/data /home/ubuntu/backups

✅ Task 3: Crontab
🔍 View existing cron jobs
crontab -l

🧠 Cron syntax
* * * * *  command
│ │ │ │ │
│ │ │ │ └── Day of week (0-7)
│ │ │ └──── Month (1-12)
│ │ └────── Day of month (1-31)
│ └──────── Hour (0-23)
└────────── Minute (0-59)

📝 Cron entries (DO NOT APPLY unless sure)
# Run log_rotate.sh every day at 2 AM
0 2 * * * /path/to/log_rotate.sh /var/log/myapp

# Run backup.sh every Sunday at 3 AM
0 3 * * 0 /path/to/backup.sh /home/data /home/backups

# Run health check script every 5 minutes
*/5 * * * * /path/to/health_check.sh

✅ Task 4: Combined Maintenance Script
📄 Script: maintenance.sh
#!/bin/bash

LOGFILE="/var/log/maintenance.log"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOGFILE"
}

log "Maintenance started."

# Call log rotation
/path/to/log_rotate.sh /var/log/myapp >> "$LOGFILE" 2>&1

# Call backup
/path/to/backup.sh /home/data /home/backups >> "$LOGFILE" 2>&1

log "Maintenance completed."

▶️ Usage
chmod +x maintenance.sh
./maintenance.sh

🕐 Cron entry for maintenance script
0 1 * * * /path/to/maintenance.sh

🧪 Observations

Scripts validate inputs before running.

Old logs and backups are cleaned automatically.

Timestamped logs help with debugging.

Cron enables full automation.

🏁 Outcome

Implemented log rotation without external tools.

Built a real backup automation script.

Learned cron scheduling syntax.

Combined multiple scripts into a single maintenance workflow.
