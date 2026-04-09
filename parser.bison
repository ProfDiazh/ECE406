%{
     #include <stdio.h>
     #include <stdlib.h>

     extern char *yytext;

     #include "ast.h"
     #define YYSTYPE struct expr *
     struct u * parser_result = 0;
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

%union u {
	struct decl *decl;
	struct stmt *stmt;
	struct expr *expr;
	struct type *type;
	char *name;
};

%type <decl> program decl_list decl 
%type <stmt> stmt
%type <expr> expr term factor
%type <type> type
%type <name> name

%%

program : decl_list                { parser_result = 0; }
      ;


decl_list : decl decl_list         
          | /* epsilon */          
      ; 



decl : type name TOKEN_SEMI        		    
     | type name TOKEN_ASSIGN expr TOKEN_SEMI    
     ;


expr : expr TOKEN_PLUS term        
     | expr TOKEN_MINUS term       
     | term                        
     ;


term : term TOKEN_MUL factor       
     | term TOKEN_DIV factor       
     | factor                      
     ;



factor : TOKEN_MINUS factor            
     | TOKEN_LPAREN expr TOKEN_RPAREN  
     | TOKEN_INT                       
     ;

%%

int yyerror( char *s ) {
	printf("parse error: %s\n",s);
	return 1;
}