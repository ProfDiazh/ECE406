#include <stdio.h>

extern struct decl * parser_result;
extern int yyparse();

int main()
{
   if(yyparse()==0) {
      printf("Parse successful!\n AST: \n ------- \n");
      decl_print(parser_result);
      printf("\n");
   } else {
      printf("Parse failed.\n");
   }
}
