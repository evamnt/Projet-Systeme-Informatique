%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symboles.h"
    int yylex();
    void yyerror(char *);
    FILE * f;
  
%}

%union  {
            char* var;
            int nb;
        }

%token  tMain tIf tPO tPF tAO tAF tInt tConst tVirgule tOpPlus tOpMoins tOpMul tOpDiv tFI tPrint tEgal
%token  <var> tNomVar
%token  <nb> tValInt

%type <char *> Operateur
%type <char**> Operation

%right  tOpEgal
%left   tOpPlus tOpMoins
%left   tOpMul tOpDiv
    
%%

File:   tMain tPO tPF tAO Body tAF 
        {printf("File reconnu\n");}
        ;

Body :  Declarations Instructions
        {printf("Body reconnu\n");}
        ;

Declarations    : Declaration Declarations
                | Declaration
                | ;
Declaration : tConst tInt tNomVar tEgal tValInt tFI
            {
                printf("Declaration de constante reconnue\n");
                printf("On essaie d'ajouter la constante : %s\n", $3);
                if (add_variable($3)) {
                    if (get_address($3) != -1)                   
                        fprintf(f,"AFC %d %d\n", get_address($3), $5);
                    else
                        printf("Erreur lors de la récupération de l'adresse de %s\n", $3);
                }                  
                else {
                    printf("Erreur lors de l'ajout de %s\n", $3);
                }
            }
            | tInt tNomVar tFI
            {
                printf("Declaration de variable reconnue\n");
                printf("On essaie d'ajouter la variable : %s\n", $2);
                if (add_variable($2)) {
                    fprintf(f,"AFC %d \n", get_address($2));
                }
                else {
                    printf("Erreur lors de l'ajout de %s\n", $2);
                }
            }
            
            | tInt tNomVar tEgal tValInt tFI
            {   
                printf("Declaration de variable reconnue\n");
                printf("On essaie d'ajouter la variable : %s\n", $2);
                if (add_variable($2)) {
                    fprintf(f,"AFC %d %d\n", get_address($2), $4);
                }
                else {
                    printf("Erreur lors de l'ajout de %s\n", $2);
                }
            }
            ;

Instructions    : Instruction Instructions 
                | Instruction
                | ;

Instruction : tNomVar tEgal Operation tFI
            {
                printf("Instruction d'operation reconnue\n");
                if($3[0] == '+')
                {
                    if ((get_address($3[1]) != -1) && (get_address($3[2]) != -1))                  
                        fprintf(f,"ADD %d %d %d\n", get_address($1), get_address($3[1]), get_address($3[2]));
                    else if ((get_address($3[1]) != -1) && (get_address($3[2]) == -1))
                        fprintf(f,"ADD %d %d %s\n", get_address($1), get_address($3[1]), $3[2]);
                    else if ((get_address($3[1]) == -1) && (get_address($3[2]) == -1))
                        fprintf(f,"ADD %d %s %s\n", get_address($1), $3[1], $3[2]);
                    else if ((get_address($3[1]) == -1) && (get_address($3[2]) != -1))
                        fprintf(f,"ADD %d %s %d\n", get_address($1), $3[1], get_address($3[2]));
                }
                else if(strcmp($3[0], '-') == 0)
                    fprintf(f,"SOU %d %d %d\n", get_address($1), $3[1], $3[2]);
                else if(strcmp($3[0], '/') == 0)
                    fprintf(f,"DIV %d %d %d\n", get_address($1), $3[1], $3[2]);
                else if(strcmp($3[0], '*') == 0)
                    fprintf(f,"MUL %d %d %d\n", get_address($1), $3[1], $3[2]);
            }
            | tPrint tPO tNomVar tPF tFI
            {printf("Instruction de print reconnue\n");}
            ;

Operations  : Operation Operateur Operations 
            | Operation;

Operation   : tNomVar Operateur tNomVar
            {
                $$ = [$2,$1,$3];
            }
                
            | tNomVar Operateur tValInt
            {
                $$ = [$2,$1,$3];
            }
            | tValInt Operateur tValInt 
            {
                $$ = [$2,$1,$3];
            }
            | tValInt Operateur tNomVar
            {$$ = [$2,$1,$3];}
            | tNomVar 
            {$$ = [$1];}
            | tValInt
            {$$ = [$1];}
            ;

Operateur   : tOpPlus
            {
                printf("Addition reconnue\n");
                $$ = "+"
            } 
            | tOpMoins 
            {
                printf("Soustraction reconnue\n");
                $$ = "-"
            } 
            | tOpDiv 
            {
                printf("Division reconnue\n");
                $$ = "/"
            } 
            | tOpMul
            {
                printf("Multiplication reconnue\n");
                $$ = "*"
            }
            ;

%%
void yyerror(char * str) {
    fprintf(stderr, "Error line %s \n", str);
}

int main(){
    initialize_table();
    f = fopen("output.asm", "a");
    yyparse();
    return 0;
}
