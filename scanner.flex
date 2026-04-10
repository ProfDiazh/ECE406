%{
#include "token.h"
%}

DIGIT [0-9]
LETTER [a-zA-Z]

%%
(" "|\t|\n)     			  /* skip whitespace */
{DIGIT}+                      { return TOKEN_INT; }
\+                            { return TOKEN_PLUS; }
\-                            { return TOKEN_MINUS; }
\*                            { return TOKEN_MUL; }
\/                            { return TOKEN_DIV; }
\(                            { return TOKEN_LPAREN; }
\)                            { return TOKEN_RPAREN; }
\;                            { return TOKEN_SEMI; }
\=                            { return TOKEN_ASSIGN; }
stm                           { return stmt; }
(int|boolean|char)            { return type; }
{LETTER}+({DIGIT}|{LETTER}|\_)*                             { return TOKEN_NAME; }

.                             { return TOKEN_ERROR; }
%%
int yywrap() { return 1; }

