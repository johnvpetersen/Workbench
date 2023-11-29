#/bin/bash
command git clone "$1" "sut/$(basename $1 .git)"
code sut
