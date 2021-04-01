struct instruction {
    char* operation;
    int operande1;
    int operande2;
    int operande3;
};

struct instruction ** table_instructions;
int next_instruction;

void initialize_table_instructions();
void add_instruction(char*, int, int, int);
void write_instructions(char*);
int get_instruction_line();
void add_jmf_instruction(int, int);
void add_jmp_instruction(int);
