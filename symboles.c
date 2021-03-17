#include "symboles.h"
#include <string.h>
#include <stdlib.h>

#define nb_symboles 1000

void initialize_table() {
    table_symboles = malloc(sizeof(struct symbole *) * nb_symboles);
    for (int i = 0; i < nb_symboles; i++) {
        table_symboles[i] = malloc(sizeof(struct symbole));
    }
    next_null = 0;
    p_actuelle = 0;
} 

void increment_depth() {
    p_actuelle += 1;
}

void decrement_depth() {
    p_actuelle -= 1;
}

int add_variable(char * id) {
    if (get_address(id) != -1) {
        printf("Erreur compilation\n");
        exit(-1);
    }
    else {
        printf("%d\n", next_null);
        if (next_null < nb_symboles) {
            table_symboles[next_null]->id = id;
            table_symboles[next_null]->depth = p_actuelle;
            next_null += 1;
            return 1; //True
        } else {
            return 0; //False
        }   
    }
}

int get_address(char * id) {
    int p_temp = p_actuelle;
    while (p_temp >= 0) {
        for(int i = 0 ; i < next_null ; i++) {
            if ((strcmp(table_symboles[i] -> id, id) == 0) && (table_symboles[i] -> depth == p_temp)) {
                return i;
            }
        }
        p_temp -= 1;
    }
    return -1;
}
