%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token A B NL

%%
stmt:s NL {printf("Acceptable String\n");exit(0);}
	;
s:A s B
 |
 ;
%%

int yyerror(char *msg)
{
	printf("Unaccepatable string\n");
	exit(0);
}

int main()
{
	printf("Enter the string:\n");
	yyparse();
}
