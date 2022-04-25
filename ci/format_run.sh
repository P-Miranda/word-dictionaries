#!/bin/bash
# format_run.sh
#
# Run formatter software over git sources.


# clang-format 
#   .c .h files
echo "clang-format formating:"
git ls-files src/*.c src/*.h \
    | xargs clang-format -style=file -fallback-style=none -i -verbose
echo "clang-format complete"

#
# add other formatters here
#

echo "format run complete"
exit 0
