#!/bin/bash

echo "Generating parser.c, token.h, and parser.output"

bison --defines=token.h --output=parser.c parser.bison -v

echo "Generating scanner.c"

flex -o scanner.c scanner.flex

echo "Compiling parser.c, scanner.c, and main.c -> compiler.exe"

gcc -w main_tree.c scanner.c parser.c -o compiler.exe
