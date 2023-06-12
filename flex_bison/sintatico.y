%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *s) { printf("ERROR: %s\n", s); }

%}

%token CODEINIT CODEEND TYPE AND_EXPR OR_EXPR PRINT WHILE IF ELSE FUNCTION RETURN EQUAL_EXPR RECEIVE COMPARE_EXPR PLUS MINUS MULT DIV COMMA NOT BOOLEAN OPEN_PARENTHESIS CLOSE_PARENTHESIS OPEN_BRACES CLOSE_BRACES NEWLINE IDENTIFIER INT FLOAT STRING

%start program

%%

program : CODEINIT statement_list CODEEND 
        ;

statement_list : statement
               | statement_list statement
               ;

block : OPEN_BRACES statement_list CLOSE_BRACES
      | OPEN_BRACES CLOSE_BRACES
      ;
        
statement : TYPE IDENTIFIER relexpression
          | IDENTIFIER
          | TYPE IDENTIFIER RECEIVE relexpression
          | PRINT OPEN_PARENTHESIS relexpression CLOSE_PARENTHESIS
          | IF OPEN_PARENTHESIS relexpression CLOSE_PARENTHESIS block
          | IF OPEN_PARENTHESIS relexpression CLOSE_PARENTHESIS block ELSE block
          | WHILE OPEN_PARENTHESIS relexpression CLOSE_PARENTHESIS block 
          | FUNCTION IDENTIFIER OPEN_PARENTHESIS func_dec_parameter_list CLOSE_PARENTHESIS OPEN_BRACES statement_list RETURN relexpression CLOSE_BRACES
          ;

func_dec_parameter_list : TYPE IDENTIFIER
               | func_dec_parameter_list COMMA TYPE IDENTIFIER
               ;

func_call_parameter_list : IDENTIFIER
               | func_call_parameter_list COMMA IDENTIFIER
               ;

relexpression: expression EQUAL_EXPR expression
             | expression COMPARE_EXPR expression
             | expression
             ;

expression: term PLUS term
          | term MINUS term
          | term OR_EXPR term
          | term
          ;
        
term: factor
    | term MULT factor
    | term DIV factor
    | term AND_EXPR factor
    ;


factor: INT 
    | STRING 
    | IDENTIFIER
    | IDENTIFIER OPEN_PARENTHESIS func_call_parameter_list CLOSE_PARENTHESIS
    | PLUS factor
    | MINUS factor
    | NOT factor
    | OPEN_PARENTHESIS relexpression CLOSE_PARENTHESIS
    ;

%%

int main(){
  yyparse();
  return 0;
}