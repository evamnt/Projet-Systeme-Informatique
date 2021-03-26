struct symbole{
    char* id;
    int depth;
};
int next_null;
int next_temp_null;
int p_actuelle;
struct symbole ** table_symboles;
void initialize_table();
void increment_depth();
void decrement_depth();
int add_variable(char *);
int get_address(char *);
int add_temp();
void flush_temp();
