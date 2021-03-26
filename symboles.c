#include "symboles.h"
#include <string.h>
#include <stdlib.h>

#define nb_symboles_variables 500
#define nb_symboles_temp 500

void initialize_table() {
    int nb_symboles_total = nb_symboles_variables + nb_symboles_temp;
    table_symboles = malloc(sizeof(struct symbole *) * nb_symboles_total);
    for (int i = 0; i < nb_symboles_total; i++) {
        table_symboles[i] = malloc(sizeof(struct symbole));
    }
    next_null = 0;
    next_temp_null = 500;
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
        //La variable a déjà été ajoutée à cette profondeur, on ne peut la ré ajouter
        printf("Erreur compilation\n");
        exit(-1);
    }
    else {
        printf("%d\n", next_null);
        if (next_null < nb_symboles_variables) {
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

int add_temp() {
    next_temp_null += 1;
    if (next_temp_null >= 1000) {
        printf("Erreur compilation\n");
        exit(-1);
    }
    else
        return next_temp_null - 1;
}

void flush_temp() {
    next_temp_null = 500;
}
