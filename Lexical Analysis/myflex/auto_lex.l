%{
 #include "stdio.h"
 #include "stdlib.h"
 #include "token.h"
 #include "stdlib.h"
%}
Y_ID _?[a-zA-Z][a-zA-Z0-9]*
num_INT [0-9]+
num_FLOAT [0-9]*\.[0-9]+
SPACE [\n\t]
%%
%{
    
%}
"0x"[1-9a-f][0-9a-f]* {
    printf("<%d,%d>\n",num_INT,strtol(yytext, NULL, 16));
}
{num_INT} {
    printf("<%d,%d>\n",num_INT,atoi(yytext));
}
{num_FLOAT} {
    printf("<%d,%f>\n",num_FLOAT,atof(yytext));
}
int {
    printf("<%d,%s>\n",Y_INT,"KEYWORD");
}
void {
    printf("<%d,%s>\n",Y_VOID,"KEYWORD");
}
const {
    printf("<%d,%s>\n",Y_CONST,"KEYWORD");
}
if {
    printf("<%d,%s>\n",Y_IF,"KEYWORD");
}
else {
    printf("<%d,%s>\n",Y_ELSE,"KEYWORD");
}
while {
    printf("<%d,%s>\n",Y_WHILE,"KEYWORD");
}
break {
    printf("<%d,%s>\n",Y_BREAK,"KEYWORD");
}
continue {
    printf("<%d,%s>\n",Y_CONTINUE,"KEYWORD");
}
return {
    printf("<%d,%s>\n",Y_RETURN,"KEYWORD");
}
float {
    printf("<%d,%s>\n",Y_FLOAT,"KEYWORD");
}
[+] {
    printf("<%d,%s>\n",Y_ADD,"OPERATOR");
}
[-] {
    printf("<%d,%s>\n",Y_SUB,"OPERATOR");
}
[*] {
    printf("<%d,%s>\n",Y_MUL,"OPERATOR");
}
[/] {
    printf("<%d,%s>\n",Y_DIV,"OPERATOR");
}
[%] {
    printf("<%d,%s>\n",Y_MODULO,"OPERATOR");
}
[<] {
    printf("<%d,%s>\n",Y_LESS,"OPERATOR");
}
"<=" {
    printf("<%d,%s>\n",Y_LESSEQ,"OPERATOR");
}
[>] {
    printf("<%d,%s>\n",Y_GREAT,"OPERATOR");
}
">=" {
    printf("<%d,%s>\n",Y_GREATEQ,"OPERATOR");
}
"!=" {
    printf("<%d,%s>\n",Y_NOTEQ,"OPERATOR");
}
"==" {
    printf("<%d,%s>\n",Y_EQ,"OPERATOR");
}
"!" {
    printf("<%d,%s>\n",Y_NOT,"OPERATOR");
}
"&&" {
    printf("<%d,%s>\n",Y_AND,"OPERATOR");
}
"||" {
    printf("<%d,%s>\n",Y_OR,"OPERATOR");
}
"=" {
    printf("<%d,%s>\n",Y_ASSIGN,"OPERATOR");
}
"(" {
    printf("<%d,%s>\n",Y_LPAR,"SYMBOL");
}
")" {
    printf("<%d,%s>\n",Y_RPAR,"SYMBOL");
}
"{" {
    printf("<%d,%s>\n",Y_LBRACKET,"SYMBOL");
}
"}" {
    printf("<%d,%s>\n",Y_RBRACKET,"SYMBOL");
}
"[" {
    printf("<%d,%s>\n",Y_LSQUARE,"SYMBOL");
}
"]" {
    printf("<%d,%s>\n",Y_RSQUARE,"SYMBOL");
}
"," {
    printf("<%d,%s>\n",Y_COMMA,"SYMBOL");
}
";" {
    printf("<%d,%s>\n",Y_SEMICOLON,"SYMBOL");
}
{Y_ID} {
 printf("<%d,%s>\n",Y_ID,yytext);
 }
{SPACE} {}
%%
void main()
 {
 yylex();
 }
 int yywrap()
 {return 1;}