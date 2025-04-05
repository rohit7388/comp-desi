%{
	#include<stdio.h>
	int v=0, c=0;
%}

%%
[aeiouAEIOU] {v++;}
[a-zA-Z] {c++;}
. {;}
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter the string:\n");
	yylex();
	printf("Vowel count: %d\nConsonants count: %d\n",v,c);
}