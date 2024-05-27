#!/bin/bash
# ./run_tests.sh

# Find all Zig test files in nested directories and run them
# Echo the name of the file being tested and the result of the test without newline
find ./src-test -name "*.zig" -type f | while read file; do
    echo -n "Testing $file "
    zig test "$file"
    if [ $? -ne 0 ]; then
        echo "Test failed: $file"
        exit 1
    fi
done
echo "All tests passed."
