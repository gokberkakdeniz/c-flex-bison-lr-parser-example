%{
#include "color.h"
#include "parser.tab.h"

void shifting(char *token);
%}

%option noyywrap
%option nounput
%option noinput

WS      [\t ]+

%%
"id"    { shifting("id"); return ID; };
"+"     { shifting("+"); return PLUS; };
"-"     { shifting("-"); return NEGATION; };
{WS}    /* eat up whitespace */
%%

void shifting(char *token) {
    printf(COLOR_GREEN "Shift token %s\n" COLOR_RESET, token);
}