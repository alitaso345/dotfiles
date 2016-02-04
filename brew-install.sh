#!/bin/sh

if [ ! -x "$(which brew)" ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed"
  exit 1
fi;
