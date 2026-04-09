#!/bin/bash

# This is a full line comment
echo "Generating parser.c, token.h, and parser.output" # This is an inline comment

bison --defines=token.h --output=parser.c parser.bison -v