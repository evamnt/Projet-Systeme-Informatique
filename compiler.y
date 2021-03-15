%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  int yylex();
  void yyerror(char *);
  FILE * f;
  char ** table_symboles;
  int add_variable(char *);
  int get_address(char *);
%}

%union  {
            char* var;
            int nb;
        }

%token  tMain tIf tPO tPF tAO tAF tInt tConst tVirgule tOpPlus tOpMoins tOpMul tOpDiv tFI tPrint tEgal
%token  <var> tNomVar
%token  <nb> tValInt

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
                if (!add_variable($3)) {
                    fprintf(f,"AFC %d %d\n", get_address($3), $5);
                }                    
                
            }
            | tInt tNomVar tFI
            {
                printf("Declaration de variable reconnue\n");
                if (!add_variable($2)) {
                    fprintf(f,"AFC %d \n", get_address($2));
                }    
            }
            
            | tInt tNomVar tEgal tValInt tFI
            {   
                printf("Declaration de variable reconnue\n");
                if (!add_variable($2)) {
                    fprintf(f,"AFC %d %d\n", get_address($2), $4);
                }    
            }
            ;

Instructions    : Instruction Instructions 
                | Instruction
                | ;

Instruction : tNomVar tEgal Operations tFI
            {
                printf("Instruction d'operation reconnue\n");
            }
            | tPrint tPO tNomVar tPF tFI
            {printf("Instruction de print reconnue\n");}
            ;

Operations  : Operation Operateur Operations 
            | Operation;

Operation   : tNomVar Operateur tNomVar
            | tNomVar Operateur tValInt
            | tValInt Operateur tValInt 
            | tValInt Operateur tNomVar
            | tNomVar 
            | tValInt;

Operateur   : tOpPlus
            {printf("Addition reconnue\n");} 
            | tOpMoins 
            {printf("Soustraction reconnue\n");} 
            | tOpDiv 
            {printf("Division reconnue\n");} 
            | tOpMul
            {printf("Multiplication reconnue\n");}
            ;

%%
void yyerror(char * str) {
  fprintf(stderr, "Error line %s \n", str);
}
int add_variable(char * symbole) {
  int table_size = sizeof(table_symboles) / sizeof(char*);
  for (int i = 0; i < table_size; i++) {
    if (table_symboles[i] == NULL) {
      table_symboles[i] = symbole;
      return 0;
    }
  }
  return 1;
}
int get_address(char * symbole) {
  int table_size = sizeof(table_symboles) / sizeof(char*);
  for (int i = 0; i < table_size; i++) {
    if (strcmp(table_symboles[i], symbole) == 0) {
      return i;
    }
  }
  return -1;
}
int main(){
  table_symboles = (char **) malloc(sizeof(char*)*1000);
  f = fopen("output.asm", "w");
  yyparse();
  return 0;
}
