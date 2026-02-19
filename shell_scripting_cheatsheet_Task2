## Task 2: Operators and Conditionals

This section covers comparisons, file tests, and conditional logic used in Shell scripts.

---

## 1. String Comparisons

| Operator | Meaning |
|----------|---------|
| =        | Equal to |
| !=       | Not equal to |
| -z       | String is empty |
| -n       | String is not empty |

### Example:
```bash
#!/bin/bash

STR1="Linux"
STR2="DevOps"

if [ "$STR1" = "$STR2" ]; then
  echo "Strings are equal"
else
  echo "Strings are not equal"
fi

if [ -z "$STR1" ]; then
  echo "String is empty"
fi

if [ -n "$STR1" ]; then
  echo "String is not empty"
fi



2. Integer Comparisons
Operator	Meaning
-eq	Equal
-ne	Not equal
-lt	Less than
-gt	Greater than
-le	Less than or equal
-ge	Greater than or equal
Example:
#!/bin/bash

NUM1=10
NUM2=20

if [ $NUM1 -lt $NUM2 ]; then
  echo "NUM1 is less than NUM2"
fi

if [ $NUM1 -ge $NUM2 ]; then
  echo "NUM1 is greater or equal to NUM2"
fi



3. File Test Operators
Operator	Meaning
-f	File exists and is a regular file
-d	Directory exists
-e	File or directory exists
-r	Readable
-w	Writable
-x	Executable
-s	File is not empty
Example:
#!/bin/bash

FILE="test.txt"

if [ -f "$FILE" ]; then
  echo "File exists"
fi

if [ -s "$FILE" ]; then
  echo "File is not empty"
fi

if [ -x "$FILE" ]; then
  echo "File is executable"
fi





4. if, elif, else Syntax
Syntax:
if [ condition ]; then
  command
elif [ condition ]; then
  command
else
  command
fi
Example:
#!/bin/bash

AGE=18

if [ $AGE -lt 18 ]; then
  echo "Minor"
elif [ $AGE -eq 18 ]; then
  echo "Just became an adult"
else
  echo "Adult"
fi





5. Logical Operators
Operator	Meaning
&&	AND
!	NOT
Example:
#!/bin/bash

NUM=15

if [ $NUM -gt 10 ] && [ $NUM -lt 20 ]; then
  echo "Number is between 10 and 20"
fi

if [ $NUM -lt 5 ] || [ $NUM -gt 30 ]; then
  echo "Number is out of range"
fi

if ! [ -f "data.txt" ]; then
  echo "File does not exist"
fi





6. Case Statements (case ... esac)
Syntax:
case VARIABLE in
  pattern1)
    command
    ;;
  pattern2)
    command
    ;;
  *)
    default command
    ;;
esac
Example:
#!/bin/bash

read -p "Enter a choice (start|stop|restart): " ACTION

case $ACTION in
  start)
    echo "Service starting..."
    ;;
  stop)
    echo "Service stopping..."
    ;;
  restart)
    echo "Service restarting..."
    ;;
  *)
    echo "Invalid option"
    ;;
esac
