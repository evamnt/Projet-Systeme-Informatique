%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symboles.h"
    #include "table_instructions.h"

    int jmf_line;
    int jmp_line;

    int yylex();
    void yyerror(char *);
%}

%union  {
            char* var;
            int nb;
        }

%token  tMain tIf tElse tWhile tPO tPF tAO tAF tInt tConst tVirgule tOpPlus tOpMoins tOpMul tOpDiv tFI tPrint tEgal tSup tInf tEqu
%token  <var> tNomVar
%token  <nb> tValInt

%type <nb> Operation
%type <nb> Operande
%type <nb> Condition

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
                    if (get_address($3) != -1) {  
                        add_instruction("AFC", get_address($3), $5, NULL, 2);
                        //fprintf(f,"AFC %d %d\n", get_address($3), $5);
                    }
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
                    add_instruction("AFC", get_address($2), NULL, NULL, 1);
                    //fprintf(f,"AFC %d \n", get_address($2));
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
                    add_instruction("AFC", get_address($2), $4, NULL, 2);
                    //fprintf(f,"AFC %d %d\n", get_address($2), $4);
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
                add_instruction("COP", get_address($1), $3, NULL, 2);
                //fprintf(f, "COP %d %d\n", get_address($1), $3);
                flush_temp();
            }
            | tPrint tPO tNomVar tPF tFI
            {
                add_instruction("PRI", get_address($3), NULL, NULL, 1);                
                //fprintf(f, "PRI %d\n", get_address($3));
            }
            | tIf tPO Condition tPF tAO Body tAF
            {
                add_jmf_instruction(jmf_line, $3, 0);
                decrement_depth();
            }
            | tIf tPO Condition tPF tAO Body tAF 
            {
                add_jmf_instruction(jmf_line, $3, 1);
                jmp_line = get_instruction_line();
                decrement_depth();
                increment_depth();
            } tElse tAO Body tAF
            {
                add_jmp_instruction(jmp_line);
                decrement_depth();
            }
            | tWhile tPO Condition tPF tAO Body tAF
            {
                add_jmf_instruction(jmf_line, $3, 1);
                add_instruction("JMP", jmf_line - 1, NULL, NULL, 1);
                decrement_depth();
            };

Operation   : tPO Operation tPF 
            {
                $$ = $2;
            }
            | Operation tOpPlus Operation 
            {
                int adr = add_temp();
                add_instruction("ADD", adr, $1, $3, 3);
                //fprintf(f, "ADD %d %d %d\n", adr, $1, $3);
                $$ = adr;
            }
            | Operation tOpMoins Operation
            {
                int adr = add_temp();
                add_instruction("SOU", adr, $1, $3, 3);
                //fprintf(f, "SOU %d %d %d\n", adr, $1, $3);
                $$ = adr;
            }
            | Operation tOpMul Operation
            {
                int adr = add_temp();
                add_instruction("MUL", adr, $1, $3, 3);
                //fprintf(f, "MUL %d %d %d\n", adr, $1, $3);
                $$ = adr;
            }
            | Operation tOpDiv Operation
            {
                int adr = add_temp();
                add_instruction("DIV", adr, $1, $3, 3);
                //fprintf(f, "DIV %d %d %d\n", adr, $1, $3);
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
                add_instruction("AFC", adr, $1, NULL, 2);
                //fprintf( f, "AFC %d %d\n", adr, $1);
                $$ = adr;
            };

Condition   : Operande tSup Operande
            {
                int adr = add_temp();
                printf("Operateur 1 = %d\n", adr);
                add_instruction("SUP", adr, $1, $3, 3);
                //fprintf(f,"SUP %d %d %d\n", adr, $1,$3);
                jmf_line = get_instruction_line();
                $$ = adr;
                increment_depth();
            }
            | Operande tInf Operande
            {
                int adr = add_temp();
                add_instruction("INF", adr, $1, $3, 3);
                //fprintf(f,"INF %d %d %d\n", adr, $1, $3);
                jmf_line = get_instruction_line();
                $$ = adr;
                increment_depth();
            }
            | Operande tEqu Operande
            {
                int adr = add_temp();
                add_instruction("EQU", adr, $1, $3, 3);
                //fprintf(f,"EQU %d %d %d\n", adr, $1,$3);
                jmf_line = get_instruction_line();
                $$ = adr;
                increment_depth();
            }
            ;
%%
void yyerror(char * str) {
    fprintf(stderr, "Error line %s \n", str);
}

int main(){
    initialize_table();
    initialize_table_instructions();
    yyparse();
    write_instructions("output.asm");
    return 0;
}
