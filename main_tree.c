#include <stdio.h>

extern struct decl * parser_result;
extern int yyparse();
extern void decl_print(struct decl *e );
extern FILE *yyin;

int main()
{
	yyin = fopen("program.c","r"); // Set Flex's input stream to your file
	if(!yyin) {
		printf("Could not open program.c!\n");
		return 1;
	}
	
	if(yyparse()==0) { 		// Start parsing
	  printf("Parse successful!\n AST: \n ------- \n");
	  decl_print(parser_result);
	  printf("\n");
	} else {
	  printf("Parse failed.\n");
	}
}