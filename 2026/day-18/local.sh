# Function using normal (global) variable
global_function() {
    msg="I am GLOBAL variable"
    echo "Inside global_function: $msg"
}

echo "Before calling functions:"
echo "msg = $msg"

echo "--------------------------"

# Call local function
local_function
echo "After local_function:"
echo "msg = $msg"

echo "--------------------------"

# Call global function
global_function
echo "After global_function:"
echo "msg = $msg"
