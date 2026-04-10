%{
#include "token.h"
%}

DIGIT [0-9]
LETTER [a-zA-Z]
LETTER2 [a-zA-Z_]

%%
(" "|\t|\n)     			  { ; } /* skip whitespace */
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
int            				  { return TOKEN_TYPE_INT; }
char            			  { return TOKEN_TYPE_CHAR; }
(bool|boolean)                { return TOKEN_TYPE_BOOL; }
{LETTER}+{LETTER2}*           { return TOKEN_NAME; }


.                             { return TOKEN_ERROR; }
%%
int yywrap() { return 1; }

