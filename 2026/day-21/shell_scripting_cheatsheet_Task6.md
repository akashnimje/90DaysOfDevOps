## Task 6: Useful Patterns and One-Liners

These are practical, real-world one-liners commonly used in system administration and DevOps work.

---

## 1. Find and Delete Files Older Than N Days

Delete files older than 7 days:
```bash
find /path/to/dir -type f -mtime +7 -delete
Preview before deleting:

find /path/to/dir -type f -mtime +7





2. Count Lines in All .log Files
wc -l *.log
Total lines only:

cat *.log | wc -l
3. Replace a String Across Multiple Files





Replace "ERROR" with "FAIL" in all .txt files:

sed -i 's/ERROR/FAIL/g' *.txt
Replace in all files under a directory:

sed -i 's/oldvalue/newvalue/g' /path/to/dir/*





4. Check if a Service is Running
Using systemctl:

systemctl status nginx
Script-friendly check:

systemctl is-active nginx
Conditional check:

systemctl is-active nginx && echo "Running" || echo "Stopped"





5. Monitor Disk Usage with Alert
Show disk usage:

df -h
Alert if usage > 80%:

df -h | awk '$5+0 > 80 {print "Warning: " $1 " is " $5 " full"}'





6. Parse CSV from Command Line
Print 1st and 3rd columns:

cut -d, -f1,3 data.csv
Using awk:

awk -F, '{print $1, $3}' data.csv





7. Parse JSON from Command Line (jq)
Get a field from JSON:

jq '.name' file.json
Get multiple fields:

jq '.name, .age' file.json





8. Tail a Log and Filter Errors in Real Time
tail -f app.log | grep -i error
With line numbers:

tail -f app.log | grep -in error





9. Show Top 10 Largest Files
du -ah /path | sort -rh | head -10
10. Kill a Process by Name
pkill nginx
Or:

ps -ef | grep nginx | grep -v grep
