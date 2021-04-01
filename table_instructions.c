#include "table_instructions.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define max_instructions 1000

void initialize_table_instructions() {
    table_instructions = malloc(sizeof(struct instruction *) * max_instructions);
    for (int i = 0; i < max_instructions; i++) {
        table_instructions[i] = malloc(sizeof(struct instruction));
    }
    next_instruction = 0;
}

void add_instruction(char* operation, int operande1, int operande2, int operande3) {
    table_instructions[next_instruction]->operation = operation;
    table_instructions[next_instruction]->operande1 = operande1;
    table_instructions[next_instruction]->operande2 = operande2;
    table_instructions[next_instruction]->operande3 = operande3;
    next_instruction++;
}

void write_instructions(char* filename) {
    FILE * f;
    f = fopen(filename, "a");
    for (int i = 0; i < next_instruction; i++) {
        if (table_instructions[i]->operande2 == NULL)
            fprintf(f, "%s %d\n", table_instructions[i]->operation, table_instructions[i]->operande1);
        else if (table_instructions[i]->operande3 == NULL)
            fprintf(f, "%s %d %d\n", table_instructions[i]->operation, table_instructions[i]->operande1, table_instructions[i]->operande2);
        else        
            fprintf(f, "%s %d %d %d\n", table_instructions[i]->operation, table_instructions[i]->operande1, table_instructions[i]->operande2, table_instructions[i]->operande3);
    }
}

int get_instruction_line() {
    next_instruction++;
    return next_instruction - 1;
}

void add_jmf_instruction(int instruction_line, int res_cond) {
    table_instructions[instruction_line]->operation = "JMF";
    table_instructions[instruction_line]->operande1 = res_cond;
    table_instructions[instruction_line]->operande2 = next_instruction + 1;
}

void add_jmp_instruction(int instruction_line) {
    table_instructions[instruction_line]->operation = "JMP";
    table_instructions[instruction_line]->operande1 = next_instruction + 1;
}
