## Task 5: Text Processing Commands

These commands are used to search, filter, transform, and analyze text files and command output.

---

## 1. grep (Search Text)

### Common Flags:
| Flag | Meaning |
|------|---------|
| -i | Case-insensitive |
| -r | Recursive search |
| -c | Count matching lines |
| -n | Show line numbers |
| -v | Invert match (not matching) |
| -E | Extended regex |

### Examples:
```bash
grep "error" logfile.txt
grep -i "fail" logfile.txt
grep -r "ERROR" /var/log
grep -n "root" /etc/passwd
grep -c "success" file.txt
grep -v "INFO" logfile.txt
grep -E "error|fail" logfile.txt





2. awk (Column & Pattern Processing)
Print columns:
awk '{print $1}' file.txt
awk '{print $1, $3}' file.txt
Field separator:
awk -F: '{print $1}' /etc/passwd
Pattern matching:
awk '/error/ {print $0}' logfile.txt
BEGIN and END:
awk 'BEGIN {print "Start"} {print $1} END {print "End"}' file.txt





3. sed (Stream Editor)
Substitution:
sed 's/Linux/Unix/' file.txt
sed 's/Linux/Unix/g' file.txt
Delete lines:
sed '2d' file.txt
sed '/error/d' file.txt
In-place edit:
sed -i 's/old/new/g' file.txt





4. cut (Extract Columns)
By delimiter:
cut -d: -f1 /etc/passwd
cut -d, -f2 data.csv
By character position:
cut -c1-5 file.txt





5. sort (Sorting Data)
Alphabetical:
sort names.txt
Numerical:
sort -n numbers.txt
Reverse:
sort -r names.txt
Unique:
sort -u names.txt





6. uniq (Remove Duplicates)
Works best on sorted input.

Examples:
uniq file.txt
uniq -c file.txt
sort file.txt | uniq
sort file.txt | uniq -c





7. tr (Translate/Delete Characters)
Translate:
tr 'a-z' 'A-Z' < file.txt
Delete:
tr -d '0-9' < file.txt





8. wc (Count)
Option	Meaning
-l	Lines
-w	Words
-c	Characters
Example:
wc file.txt
wc -l file.txt
wc -w file.txt
wc -c file.txt





9. head and tail
First N lines:
head -n 5 file.txt
Last N lines:
tail -n 5 file.txt
Follow mode (live logs):
tail -f logfile.txt
