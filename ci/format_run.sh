#!/bin/bash
# format_run.sh
#
# Run formatter software over git sources.


# clang-format 
#   .c .h files
echo "clang-format formating:"
if ! command -v clang-format &> /dev/null
then
    echo "Error: clang-format is not installed"
    exit 1
else
    git ls-files src/*.c src/*.h \
        | xargs clang-format -style=file -fallback-style=none -i -verbose
    echo "clang-format complete"
fi

#
# add other formatters here
#

echo "format run complete"
exit 0
