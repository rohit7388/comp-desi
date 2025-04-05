%{
	#include<stdio.h>
	int c=0, w=0, l=0, s=0;
%}

WORD [^ \t\n,\.:]+
BLANK [ \t]
EOL [\n]

%%
{WORD} {w++;c=c+yyleng;}
{EOL} {l++;}
{BLANK} {s++;}
%%

int yywrap()
{
	return 1;
}

int main(int argc, char *argv[])
{
	if(argc!=2)
	{
		printf("Command error: ./a.out filename.txt\n");
		exit(0);
	}
	yyin=fopen(argv[1],"r");
	yylex();
	printf("No of lines: %d\nNo of characters: %d\nNo of words: %d\nNo of spaces: %d\n",l,c,w,s);
}