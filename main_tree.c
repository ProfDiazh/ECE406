#include <stdio.h>

extern struct decl * parser_result;
extern int yyparse();
extern void decl_print(struct decl *e );

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
