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

%token  tMain tIf tPO tPF tAO tAF tInt tConst tVirgule tOpPlus tOpMoins tOpMul tOpDiv tFI tPrint tEgal tSup tInf tEqu tIf
%token  <var> tNomVar
%token  <nb> tValInt

%type <nb> Operation
%type <nb> Operande

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
                fprintf(f, "COP %d %d\n", get_address($1), $3);
                flush_temp();
            }
            | tPrint tPO tNomVar tPF tFI
            {
                fprintf(f, "PRI %d\n", get_address($3));
            }
            | tIf tPO Condition tPF tAO Instructions tAF
            {
                fprintf(f,"JMF %d %d\n", $3,$7);
            };

Operation   : tPO Operation tPF 
            {
                $$ = $2;
            }
            | Operation tOpPlus Operation 
            {
                int adr = add_temp();
                fprintf(f, "ADD %d %d %d\n", adr, $1, $3);
                $$ = adr;
            }
            | Operation tOpMoins Operation
            {
                int adr = add_temp();
                fprintf(f, "SOU %d %d %d\n", adr, $1, $3);
                $$ = adr;
            }
            | Operation tOpMul Operation
            {
                int adr = add_temp();
                fprintf(f, "MUL %d %d %d\n", adr, $1, $3);
                $$ = adr;
            }
            | Operation tOpDiv Operation
            {
                int adr = add_temp();
                fprintf(f, "DIV %d %d %d\n", adr, $1, $3);
                $$ = adr;
            }
            | Operande
            {
                $$ = $1;
            };

Operande    : tNomVar 
            {
                $$ = get_address($1);
            }
            | tValInt
            {
                int adr = add_temp();
                fprintf( f, "AFC %d %d\n", adr, $1);
                $$ = adr;
            };

Condition   : Operande tSup Operande
            {
                int adr
            | Operande tInf Operande
            | Operande tEqu Operande
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
