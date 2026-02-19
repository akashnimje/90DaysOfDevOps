## Task 4: Functions

Functions allow you to group commands into reusable blocks of code.

---

## 1. Defining a Function

### Syntax:
```bash
function_name() {
  command
}
Example:
#!/bin/bash

greet() {
  echo "Hello, World!"
}





2. Calling a Function
Example:
#!/bin/bash

greet() {
  echo "Hello, DevOps!"
}

greet





3. Passing Arguments to Functions
Inside a function:

$1 = first argument

$2 = second argument

$@ = all arguments

Example:
#!/bin/bash

add() {
  echo "First number: $1"
  echo "Second number: $2"
  echo "Sum: $(($1 + $2))"
}

add 10 20





4. Return Values (return vs echo)
Using return (only for numeric exit codes: 0–255):
#!/bin/bash

check_even() {
  if [ $(($1 % 2)) -eq 0 ]; then
    return 0   # success
  else
    return 1   # failure
  fi
}

check_even 4
echo "Exit status: $?"
Using echo (to return actual data):
#!/bin/bash

get_date() {
  echo "Today is $(date)"
}

RESULT=$(get_date)
echo "$RESULT"





5. Local Variables
By default, variables inside functions are global.
Use local to limit scope to the function.

Example:
#!/bin/bash

my_function() {
  local VAR="Inside function"
  echo $VAR
}

my_function
echo $VAR   # This will be empty




6. Function with Input and Output
Example:
#!/bin/bash

multiply() {
  local RESULT=$(($1 * $2))
  echo $RESULT
}

OUTPUT=$(multiply 3 5)
echo "Result: $OUTPUT"
