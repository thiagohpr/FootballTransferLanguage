%{
#include <stdio.h>
#include <stdlib.h>
#include "sintatico.tab.h"
//extern int yywrap();
%}

%{
#define YYEOF 0
%}

CODEINIT Here_we_Go
CODEEND End_of_Record
DIGIT [0-9]
LETTER [a-zA-Z]
AND_EXPR and
OR_EXPR or
PRINT leak
WHILE begin_conversation
IF consider_rumour
ELSE or_else_do
FUNCTION begin_transference
RETURN complete_transference
EQUAL_EXPR "=="
RECEIVE is
COMPARE_EXPR ">"|"<"
IDENTIFIER  [a-zA-Z_][_a-zA-Z0-9]*
PLUS "+"
MINUS "-"
MULT "*"
DIV "/"
NOT "!"
COMMA ","
BOOLEAN green|red 
TYPE player|deal|value

%%

{TYPE}                  { printf("TYPE: %s\n", yytext); return TYPE; }
{AND_EXPR}              { printf("AND_EXPR: %s\n", yytext); return AND_EXPR; }
{OR_EXPR}               { printf("OR_EXPR: %s\n", yytext); return OR_EXPR; }
{CODEINIT}              { printf("CODEINIT: %s\n", yytext); return CODEINIT; }
{CODEEND}               { printf("CODEEND: %s\n", yytext); return CODEEND; }
{PRINT}                 { printf("PRINT: %s\n", yytext); return PRINT; }
{WHILE}                 { printf("WHILE: %s\n", yytext); return WHILE; }
{IF}                    { printf("IF: %s\n", yytext); return IF; }
{ELSE}                  { printf("ELSE: %s\n", yytext); return ELSE; }
{FUNCTION}              { printf("FUNCTION: %s\n", yytext); return FUNCTION; }
{RETURN}                { printf("RETURN: %s\n", yytext); return RETURN; }
{EQUAL_EXPR}            { printf("EQUAL_EXPR: %s\n", yytext); return EQUAL_EXPR; }
{RECEIVE}               { printf("RECEIVE: %s\n", yytext); return RECEIVE; }
{COMPARE_EXPR}          { printf("COMPARE_EXPR: %s\n", yytext); return COMPARE_EXPR; }
{PLUS}                  { printf("PLUS: %s\n", yytext); return PLUS; }
{MINUS}                 { printf("MINUS: %s\n", yytext); return MINUS; }
{MULT}                  { printf("MULT: %s\n", yytext); return MULT; }
{DIV}                   { printf("DIV: %s\n", yytext); return DIV; }
{NOT}                   { printf("NOT: %s\n", yytext); return NOT; }
{COMMA}                 { printf("COMMA: %s\n", yytext); return COMMA; }
{BOOLEAN}               { printf("BOOLEAN: %s\n", yytext); return BOOLEAN; }
{IDENTIFIER}            { printf("IDENTIFIER: %s\n", yytext);  return IDENTIFIER;  }
{DIGIT}+                { printf("INT: %s \n", yytext); return INT; }
{DIGIT}+[.]{DIGIT}+     { printf("FLOAT: %s \n", yytext); return FLOAT; }
\'([^\\\n]|(\\.))*\'    { printf("STRING: %s\n", yytext); return STRING; }
\"([^\\\n]|(\\.))*\"    { printf("STRING: %s\n", yytext); return STRING; }
"("                     { printf("OPEN_PARENTHESIS: %s \n", yytext); return OPEN_PARENTHESIS; }
")"                     { printf("CLOSE_PARENTHESIS: %s \n", yytext); return CLOSE_PARENTHESIS; }
"{"                     { printf("OPEN_BRACES: %s \n", yytext); return OPEN_BRACES; }
"}"                     { printf("CLOSE_BRACES: %s \n", yytext); return CLOSE_BRACES; }

[ \t\n]                   { /* ignore */ }

. { printf("ERRO: %s \n", yytext); return 404; }

%%

int yywrap() {
    return 1;
}

/*
int main()
{
    yylex();
    return 0;
}
*/