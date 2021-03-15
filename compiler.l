%{
#include "y.tab.h"
%}
%%
\{ {printf("%s trouvé \n", yytext); return tAO;}
\} {printf("%s trouvé\n", yytext); return tAF;}
main {printf("fonction main trouvée\n"); return tMain;}
printf {printf("fonction printf trouvé\n"); return tPrint;}
const {printf("déclaration de constante trouvée\n"); return tConst;}
int {printf("type int trouvé\n"); return tInt;}
[a-zA-Z][a-zA-Z0-9_]*   {
                            printf("nom de variable %s trouvé\n", yytext); 
                            yylval.var = yytext;
                            return tNomVar;
                        }
"+" {printf("opérateur + trouvé\n", yytext); return tOpPlus;}
- {printf("opérateur - trouvé\n", yytext); return tOpMoins;}
"*" {printf("opérateur * trouvé\n", yytext); return tOpMul;}
"/" {printf("opérateur / trouvé\n", yytext); return tOpDiv;}
= {printf("opérateur = trouvé\n"); return tEgal;}
[ \t,] printf("séparateur %s trouvé\n", yytext); 
\n printf("fin de ligne trouvée\n");
\; {printf("fin d'instruction trouvée\n"); return tFI;}
[0-9]+  {
            printf("entier %s trouvé\n", yytext); 
            yylval.nb = atoi(yytext);
            return tValInt;
        }
[0-9]+e[0-9]+ printf("entier sous forme exponentielle %s trouvé\n", yytext);
\( {printf("parenthèse ouvrante trouvée\n"); return tPO;}
\) {printf("parenthèse fermante trouvée\n"); return tPF;}


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
