# Colors.sh
# Author: Alex LaFroscia
#
# Based on rainbow.sh by Manuel Gutierrez <dhunterkde@gmail.com>
# https://github.com/xr09/rainbow.sh
#
# Adds support for newer versions of Mac OSX that do not support the \e
# escapre sequence
#


if [ "$(uname)" == "Darwin" ]; then
  __ESCAPESEQ="\x1b"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  __ESCAPESEQ="\e"
fi


function __colortext()
{
  echo -e " $__ESCAPESEQ[$2m$1$__ESCAPESEQ[0m"
}

function echogreen() 
{
  echo $(__colortext "$1" "32")
}

function echored() 
{
  echo $(__colortext "$1" "31")
}

function echoblue() 
{
  echo $(__colortext "$1" "34")
}

function echopurple() 
{
  echo $(__colortext "$1" "35")
}

function echoyellow() 
{
  echo $(__colortext "$1" "33")
}

function echocyan() 
{
  echo $(__colortext "$1" "36")
}
