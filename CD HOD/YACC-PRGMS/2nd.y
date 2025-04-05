%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token NUMBER ID NL;
%left '+' '-'
%left '*' '/'
%%
stmt: expr NL {printf("Valid");exit(0);}
	;
expr: expr '+' expr
	| expr '-' expr
	| expr '*' expr
	| expr '/' expr
	| '(' expr ')'
	| '[' expr ']'
 	| '{' expr '}'
	| ID
	| NUMBER
	;
%%
int yyerror()
{
	printf("Invalid expr\n");
	exit(0);
}

int main()
{
	printf("Enter the expr:\n");
	yyparse();
}