✅ Task 1: Input and Validation
📜 Script (Task 1 part)
#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
    echo "Error: No log file provided."
    echo "Usage: ./log_analyzer.sh <logfile>"
    exit 1
fi

LOGFILE=$1

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1
fi

echo "Log file validated: $LOGFILE"

▶ Example Output
$ ./log_analyzer.sh
Error: No log file provided.
Usage: ./log_analyzer.sh <logfile>

$ ./log_analyzer.sh app.log
Log file validated: app.log

✅ Task 2: Error Count
📜 Add to script
ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOGFILE" | wc -l)
echo "Total Errors: $ERROR_COUNT"

▶ Example Output
Total Errors: 128

✅ Task 3: Critical Events
📜 Add to script
echo " "
echo "--- Critical Events ---"
grep -n "CRITICAL" "$LOGFILE"

▶ Example Output
--- Critical Events ---
Line 84: 2025-07-29 10:15:23 CRITICAL Disk space below threshold
Line 217: 2025-07-29 14:32:01 CRITICAL Database connection lost

✅ Task 4: Top 5 Error Messages
📜 Add to script
echo " "
echo "--- Top 5 Error Messages ---"

grep "ERROR" "$LOGFILE" \
| awk '{$1=$2=""; print $0}' \
| sort \
| uniq -c \
| sort -nr \
| head -5

▶ Example Output
--- Top 5 Error Messages ---
45 Connection timed out
32 File not found
28 Permission denied
15 Disk I/O error
9  Out of memory

✅ Task 5: Summary Report
📜 Add to script
DATE=$(date +%F)
REPORT="log_report_$DATE.txt"
TOTAL_LINES=$(wc -l < "$LOGFILE")

{
echo "Log Analysis Report"
echo "-------------------"
echo "Date: $DATE"
echo "Log File: $LOGFILE"
echo "Total Lines: $TOTAL_LINES"
echo "Total Errors: $ERROR_COUNT"

echo " "
echo "Top 5 Error Messages:"
grep "ERROR" "$LOGFILE" \
| awk '{$1=$2=""; print $0}' \
| sort | uniq -c | sort -nr | head -5

echo " "
echo "Critical Events:"
grep -n "CRITICAL" "$LOGFILE"

} > "$REPORT"

echo "Report generated: $REPORT"

▶ Example Output
Report generated: log_report_2026-02-18.txt


📄 Sample report file content

Log Analysis Report
-------------------
Date: 2026-02-18
Log File: app.log
Total Lines: 3500
Total Errors: 128

Top 5 Error Messages:
45 Connection timed out
32 File not found
28 Permission denied
15 Disk I/O error
9 Out of memory

Critical Events:
Line 84: CRITICAL Disk space below threshold
Line 217: CRITICAL Database connection lost

✅ Task 6 (Optional): Archive Processed Logs
📜 Add to script
ARCHIVE_DIR="archive"

if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir "$ARCHIVE_DIR"
fi

mv "$LOGFILE" "$ARCHIVE_DIR"

echo "Log file archived to $ARCHIVE_DIR/"

▶ Example Output
Log file archived to archive/

✅ FINAL COMPLETE SCRIPT (log_analyzer.sh)
#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No log file provided."
    echo "Usage: ./log_analyzer.sh <logfile>"
    exit 1
fi

LOGFILE=$1

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1
fi

ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOGFILE" | wc -l)
TOTAL_LINES=$(wc -l < "$LOGFILE")
DATE=$(date +%F)
REPORT="log_report_$DATE.txt"

echo "Total Errors: $ERROR_COUNT"

echo "--- Critical Events ---"
grep -n "CRITICAL" "$LOGFILE"

echo "--- Top 5 Error Messages ---"
grep "ERROR" "$LOGFILE" \
| awk '{$1=$2=""; print $0}' \
| sort | uniq -c | sort -nr | head -5

{
echo "Log Analysis Report"
echo "Date: $DATE"
echo "Log File: $LOGFILE"
echo "Total Lines: $TOTAL_LINES"
echo "Total Errors: $ERROR_COUNT"

echo "Top 5 Error Messages:"
grep "ERROR" "$LOGFILE" \
| awk '{$1=$2=""; print $0}' \
| sort | uniq -c | sort -nr | head -5

echo "Critical Events:"
grep -n "CRITICAL" "$LOGFILE"
} > "$REPORT"

ARCHIVE_DIR="archive"
[ ! -d "$ARCHIVE_DIR" ] && mkdir "$ARCHIVE_DIR"
mv "$LOGFILE" "$ARCHIVE_DIR"

echo "Report generated: $REPORT"
echo "Log file archived to $ARCHIVE_DIR/"
