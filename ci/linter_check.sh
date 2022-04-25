#!/bin/bash
# linter_check.sh
#
# Check all .c .h files for linting problems
# return:   1 in case of formatting errors
#           0 in all files are correctly formatted  
#

# clang-tidy check
tidy_log=clang_tidy.log

# check for clang-tidy in $PATH
if ! command -v run-clang-tidy &> /dev/null
then
    echo "Error: clang-tidy is not installed"
    exit 1
fi

# check for compile_commands.json
if [[ ! -f "compile_commands.json" ]];
then
    bear make build
fi

run-clang-tidy 2> $tidy_log

if [ ! -s $tidy_log ]
then
    echo "clang-tidy check passed"
    rm $tidy_log
else
    echo "clang-tidy check failed"
    rm $tidy_log
    exit 1
fi

#
# add other linters here
#

echo "linter check completed"
exit 0
