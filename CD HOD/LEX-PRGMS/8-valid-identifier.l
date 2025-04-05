%{
	#include<stdio.h>
	int id=0;
%}

%%
[a-zA-Z][a-zA-Z0-9_]* {id++;ECHO;printf("\n");}
.+ {;}
\n {;}
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter the identifier:\n");
	yylex();
	printf("Number of identifiers: %d",id);
}