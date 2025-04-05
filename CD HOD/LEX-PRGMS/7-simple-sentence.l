%{
	#include<stdio.h>
	int is_simple=0;
%}

%%
[ \t\n]+[aA][nN][dD]+[ \t\n] {is_simple=1;}
[ \t\n]+[oO][rR]+[ \t\n] {is_simple=1;}
[ \t\n]+[bB][uU][tT]+[ \t\n] {is_simple=1;}
%%

int yywrap()
{
	return 1;
}

int main(int argc, char *argv[])
{
	printf("Enter the sentence:\n");
	yylex();
	if(is_simple==0)
	{
		printf("Sentence is simple\n");
	}
	else
	{
		printf("Sentence is not simple\n");
	}
}