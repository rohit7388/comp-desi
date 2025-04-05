%{
	#include<stdio.h>
	int pc=0,sc=0;
%}

%%
"printf" {fprintf(yyout,"write");pc++;}
"scanf" {fprintf(yyout,"read");sc++;}
%%

int yywrap()
{
	return 1;
}

int main(int argc, char *argv[])
{
	if(argc!=3)
	{
		printf("Command error\n");
		exit(0);
	}
	yyin=fopen(argv[1],"r");
	yyout=fopen(argv[2],"w");
	yylex();
	printf("Number of printf statements: %d\nNumber of scanf statements: %d",pc,sc);
}