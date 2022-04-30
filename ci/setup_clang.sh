#!/bin/bash
# setup_clang.sh
#
# Install clang tools for ubuntu current version
# for more information check:
#   - https://apt.llvm.org/ (LLVM Debian/Ubuntu nightly package page)
#   - wget -O - https://apt.llvm.org/llvm.sh (download automatic install script)
#

# Check for sudo permissions
if ! [ $(id -u) = 0 ];
then 
    echo "The script needs to run as root to allow program installation."
    echo "Usage: sudo ./setup_clang.sh"
    exit 1
fi

CLANG_VERSION="14"
CLANG_TOOLS="clang-$VERSION clang-tidy-$VERSION clang-format-$VERSION"
# Set DISTRIB_CODENAME variable to identify current Ubuntu version
DISTRIB_CODENAME=$(lsb_release -cs)

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository -y "deb http://apt.llvm.org/${DISTRIB_CODENAME}/ llvm-toolchain-${DISTRIB_CODENAME}-$CLANG_VERSION main"
sudo apt update
sudo apt install -y $CLANG_TOOLS

# check clang tools
for tool in $CLANG_TOOLS
do
    if ! command -v $tool &> /dev/null
    then
        echo "Error: $tool is not installed"
        exit 1
    else
        echo "$tool installed"
    fi
done

echo "All clang tools installed"
exit 0
