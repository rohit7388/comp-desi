%{
	#include<stdio.h>
	int posint=0, negint=0, posfrac=0, negfrac=0;
%}

%%
[-][0-9]+ {negint++;}
[+]?[0-9]+ {posint++;}
[-][0-9]*\.[0-9]+ {negfrac++;}
[+]?[0-9]*\.[0-9]+ {posfrac++;}
%%

int yywrap()
{
	return 1;
}

int main(int argc, char *argv[])
{
	if(argc!=2)
	{
		printf("Command error\n");
		exit(0);
	}
	yyin=fopen(argv[1],"r");
	yylex();
	printf("+ve Integers: %d\n-ve Integers: %d\n+ve Fractions: %d\n-ve Fractions: %d\n",posint,negint,posfrac,negfrac);
}