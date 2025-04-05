%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token NUMBER ID NL
%left '+''-'
%left '*''/'

%%
stmt: expr NL {printf("Valid Expression\n");exit(0);}
    ;

expr:expr'+'expr
    |expr'-'expr
	|expr'*'expr
	|expr'/'expr
	|'('expr')'
	|'['expr']'
	|'{'expr'}'
	|NUMBER
	|ID
	;
%%

int yyerror()
{
	printf("Invalid expression\n");
	exit(0);
}

main()
{
	printf("Enter the expression:\n");
	yyparse();
}