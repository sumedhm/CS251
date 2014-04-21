
%{
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <string.h>
int db=0,nr=0,i=0,j=0,r,k=0;
int bd=0,ove=0,mr=0,mb=0,mo=0;
int found,oo,ro,ball=0,cball=0,co=0,lo=0,lb=0;
char cb[50];
struct bowlers{
	char name[50];
	int wides;
};
	struct bowlers bowler[11];
	static void yyerror (char *s)
	{
        printf ( "yyerror: %s\n", s );
	}
	int Isanalpha(char c)
	{
	int a=0;
	if ((c>='a' && c<='z') || (c>='A'&& c<='Z')) a=1;
	return a;
	}
%}

blanks [\t\n ]+
number [0-9]+
word   [a-zA-z]+

%%
{blanks}	{/*ignore*/}
.|\n		{/*ignore*/}
"no run"	{db++;}
"(no ball) "{number} {nr=nr+atoi(yytext+10);}
">"{number}"."{number}"</p></td>"	{co=atoi(yytext+1);
			if (co>=10) {cball=atoi(yytext+4);} 
		else {cball=atoi(yytext+3);}}
"FOUR"|"SIX"	 	{ if(lb==0){lb=cball;lo=co;}
                  else if((co==lo) && (cball==(lb+1))) {bd++;}
		  else {bd=(1);}
		  if(bd>mb) {ball=cball;mo=co+1;mb=bd;}
			lo=co;lb=cball;
		}
"End of over "{number}"</b> ("{number}" runs)" { oo=atoi(yytext+12);
					     if (oo>=10) ro=atoi(yytext+20);
						else ro=atoi(yytext+19);
					     if (ro>mr) {ove=oo;mr=ro;}
				}
">"{word}" "*{word}*" to "{word}",\n"{number}" wide,"	{ found=0;r=0;j=1;while(Isanalpha(yytext[j])) {cb[r]=(yytext[j]);r++;j++;}
						cb[r]='\0';
						for(j=0;j<i;j++){if(strcmp(bowler[j].name,cb)==0) {bowler[j].wides++;found=1;j++;}}
						if (found==0) {strcpy(bowler[i].name,cb);bowler[i].wides=1;strcat(bowler[i].name,"\0");i++;}
						}

%%
main() {
	yylex();
        printf("\nTotal no of dot balls played: %d", db);
        printf("\nTotal runs in no balls: %d",nr);
        printf("\nMaximum number of continuous boundaries : %d(balls %d-%d) in over no. %d.",mb,ball-mb+1,ball,mo);
	j=0;i=i-1;
	if (i>=0) {for(k=0;k<=i;k++) {if(bowler[k].wides>bowler[j].wides) {j=k;} }
        printf("\nBowler who bowled maximum number of wides was %s.", bowler[j].name);}
	else {printf("\nNo bowler bowled wides.");}
        printf("\nMaximum runs (%d runs) were scored in over %d.\n\n\tGoodBye!\n\n",mr,ove);
	
}

