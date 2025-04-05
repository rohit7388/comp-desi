%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token SP CM SC NL ID INT CHAR

%%
S:type SP list ID SC NL {printf("Valid declaration\n");exit(0);}
 ;
type:CHAR
    |INT
	;
list:list SP CM SP ID
    |list CM ID
	|ID
	;
%%

int yyerror(char *msg)
{
	printf("Invalid declaration\n");
	exit(0);
}

main()
{
	printf("Enter the declaration:\n");
	yyparse();
}