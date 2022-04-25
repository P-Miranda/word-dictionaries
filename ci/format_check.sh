#!/bin/bash
# format_check.sh
#
# Check all .c .h files for formatting problems
# return:   1 in case of formatting errors
#           0 in all files are correctly formatted  
#

# clang-format check
git ls-files src/*.c src/*.h \
    | xargs clang-format -style=file -fallback-style=none -dry-run -Werror

if [ $? -eq 0 ]
then
    echo "clang-format check passed"
else
    echo "clang-format check failed"
    exit 1
fi

#
# add other formatters here
#

echo "format check completed"
exit 0
