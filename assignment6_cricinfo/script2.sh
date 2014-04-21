#!/bin/bash

clear

echo "If curl is working fine on your system use script.sh"
echo "Make sure you have match.html before running this script"

flex cric.lex
gcc -g -c lex.yy.c -o cric.lex.o
gcc -g -o cric cric.lex.o -lfl
./cric < match.html

