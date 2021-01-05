%{
#include "color.h"
#include <stdio.h>

extern int yylex();
extern int yyparse();

typedef struct yy_buffer_state *YY_BUFFER_STATE;
extern YY_BUFFER_STATE yy_scan_string(const char * str);
extern YY_BUFFER_STATE yy_scan_buffer(char *, size_t);
extern void yy_delete_buffer(YY_BUFFER_STATE buffer);
extern void yy_switch_to_buffer(YY_BUFFER_STATE buffer);

void yyerror(const char *s);
void reducing(char *rule);
void popping(char *start_symbol);
%}

%token ID;
%token PLUS NEGATION;
%left PLUS NEGATION;

%start S

%%
S: E            { reducing("S --> E"); popping("S"); };
E: E PLUS E     { reducing("E --> E + E"); }
 | NEGATION E   { reducing("E --> -E"); }
 | ID           { reducing("E --> id"); };
%%

int main(int argc, char * *argv) {
    char input[] = "id + - id + id";

    YY_BUFFER_STATE buffer = yy_scan_string(input);
    yy_switch_to_buffer(buffer);

    yyparse();

    yy_delete_buffer(buffer);
}

void yyerror(const char *s) {
    fprintf(stderr, COLOR_RESET COLOR_RED "error: %s\n" COLOR_RESET, s);
}

void reducing(char *rule) {
    printf(COLOR_YELLOW "Reduce stack by rule %s\n" COLOR_RESET, rule);
}

void popping(char *start_symbol) {
    printf(COLOR_CYAN "Pop %s\n" COLOR_RESET, start_symbol);
}