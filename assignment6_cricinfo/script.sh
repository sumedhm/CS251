#!/bin/bash

clear

echo "If curl is not running on your system please do not run this script,cancel with ^Z,download a html file with the match id,name it match.html and run script2.sh or see readme.txt"
echo "(In the link 'http://www.espncricinfo.com/icc_cricket_worldcup2011/engine/match/433606.html?innings=1;page=1;view=commentary',433606 is match id.):\nEnter match id(World cup 2011 matches only):"
read id
echo "Enter innings(1 or 2)"
read inn

curl -L -o match.html "http://www.espncricinfo.com/icc_cricket_worldcup2011/engine/match/$id.html?innings=$inn;page=1;view=commentary"

flex cric.lex
gcc -g -c lex.yy.c -o cric.lex.o
gcc -g -o cric cric.lex.o -lfl
./cric < match.html
