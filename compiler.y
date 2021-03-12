%{
  #include <stdio.h>
  int yylex();
  void yyerror(char *);
%}

%token tMain tIf tPO tPF tAO tAF tInt tConst tVirgule tOp tNomVar tFI tPrint tValInt

%%

File: tMain tAO Body tAF;

Body : Declarations Instructions;

%%
void yyerror(char * str) {
  fprintf(stderr, "Error line %s \n", str);
}
int main(){
  yyparse();
  return 0;
}
