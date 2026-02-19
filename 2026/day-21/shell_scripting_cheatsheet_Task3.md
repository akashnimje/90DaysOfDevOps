## Task 3: Loops

Loops allow you to run commands repeatedly until a condition is met.

---

## 1. for Loop (List-based)

### Syntax:
```bash
for item in list
do
  command
done
Example:
#!/bin/bash

for NAME in Linux DevOps Cloud
do
  echo "Learning $NAME"
done





2. for Loop (C-style)
Syntax:
for ((i=1; i<=5; i++))
do
  command
done
Example:
#!/bin/bash

for ((i=1; i<=5; i++))
do
  echo "Number: $i"
done





3. while Loop
Syntax:
while [ condition ]
do
  command
done
Example:
#!/bin/bash

COUNT=1

while [ $COUNT -le 5 ]
do
  echo "Count: $COUNT"
  ((COUNT++))
done





4. until Loop
Syntax:
until [ condition ]
do
  command
done
Example:
#!/bin/bash

NUM=1

until [ $NUM -gt 5 ]
do
  echo "Number: $NUM"
  ((NUM++))
done





5. Loop Control (break and continue)
break (exit loop):
#!/bin/bash

for i in 1 2 3 4 5
do
  if [ $i -eq 3 ]; then
    break
  fi
  echo "Value: $i"
done
continue (skip current iteration):
#!/bin/bash

for i in 1 2 3 4 5
do
  if [ $i -eq 3 ]; then
    continue
  fi
  echo "Value: $i"
done





6. Looping Over Files
Example:
#!/bin/bash

for file in *.log
do
  echo "Processing file: $file"
done





7. Looping Over Command Output
Using while read:
#!/bin/bash

ls | while read line
do
  echo "File: $line"
done
Another example (reading from file):
#!/bin/bash

while read line
do
  echo "Line: $line"
done < data.txt
