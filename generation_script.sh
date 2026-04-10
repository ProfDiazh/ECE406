#!/bin/bash

echo "Clean files parser.c scanner.c token.h parser.output"

rm parser.c scanner.c token.h parser.output compiler.exe

echo "Generating parser.c, token.h, and parser.output"

bison --defines=token.h --output=parser.c parser.bison -v

echo "Generating scanner.c"

flex -o scanner.c scanner.flex

echo "Compiling parser.c, scanner.c, and main.c -> compiler.exe"

gcc main_tree.c scanner.c parser.c -o compiler.exe -w

echo "Executing test1"

echo "int x;" | ./compiler.exe

echo "Executing test2"

echo "int b=5+8; int l; int c=81;" | ./compiler.exe