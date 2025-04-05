%{
	#include<stdlib.h>
	#include<stdio.h>
%}

%token INT CHAR SP SC CM ID NL
%%
S: type SP list SC NL {printf("Valid");exit(0);}
  ;
type: INT
          |CHAR
	  ;
list: list SP CM SP ID
	| list CM ID
	|list SP CM ID
	|list CM SP ID
	|ID
	;
%%

int yyerror()
{
	printf("Invalid expr\n");
	exit(0);
}

int main()
{
	printf("Enter the expression:\n");
	yyparse();
}