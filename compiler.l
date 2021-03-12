%{
#include "y.tab.h"
%}
%%
\{ {printf("%s trouvé \n", yytext); return tAO;}
\} {printf("%s trouvé\n", yytext); return tAF;}
const {printf("déclaration de constante trouvée\n"); return tConst;}
int {printf("type int trouvé\n"); return tInt;}
[a-zA-Z]([a-zA-Z0-9_]+) {printf("nom de variable %s trouvé\n", yytext); return tNomVar;}
(["+"-"*"/=()]) {printf("opérateur %s trouvé\n", yytext); return tOp;}
[ \t,] printf("séparateur %s trouvé\n", yytext); 
\n printf("fin de ligne trouvée\n");
\; {printf("fin d'instruction trouvée\n"); return tFI;}
printf(.+) {printf("fonction printf reconnue\n"); return tPrint;}
[0-9]+ {printf("entier %s reconnu\n", yytext); return tValInt;}
[0-9]+e[0-9]+ printf("entier sous forme exponentielle %s reconnu\n", yytext);
main() {printf("fonction main reconnue\n"); return tMain;} 
%%
int yywrap(void)
{
return 1;
}
/* int main(int argc, char* argv)
{
while(yylex() != 0);
return 0;
}
*/
