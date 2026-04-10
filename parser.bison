%{
     #include <stdio.h>
     #include <stdlib.h>

     extern char *yytext;

     #include "ast.h"
     #define YYSTYPE struct expr *
     
     struct expr * parser_result = 0;



%}


%token TOKEN_INT
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_MUL
%token TOKEN_DIV
%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_SEMI
%token TOKEN_ERROR
%token TOKEN_ASSIGN
%token stmt
%token type
%token name


%union {
     struct expr *expr;
};

%type <expr> expr term factor program



%%

program : expr TOKEN_SEMI          { expr_print($1); }
        ;


expr : expr TOKEN_PLUS term        { $$ = expr_create(EXPR_ADD,$1,$3); }
     | expr TOKEN_MINUS term       { $$ = expr_create(EXPR_SUB,$1,$3); }
     | term                        { $$ = $1; }
     ;


term : term TOKEN_MUL factor       { $$ = expr_create(EXPR_MUL,$1,$3);  }
     | term TOKEN_DIV factor       { $$ = expr_create(EXPR_DIV,$1,$3);  }
     | factor                      { $$ = $1; }
     ;


factor : TOKEN_MINUS factor            { $$ = expr_create(EXPR_SUB, expr_create_integer_literal(0),$2); }
     | TOKEN_LPAREN expr TOKEN_RPAREN  { $$ = $2; }
     | TOKEN_INT                       { $$ = expr_create_integer_literal(atoi(yytext)); }
     ;

%%

int yyerror( char *s ) {
	printf("parse error: %s\n",s);
	return 1;
}