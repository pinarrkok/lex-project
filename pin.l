%{
#include <stdio.h>
%}

identifier   [a-z]+
word	     [A-Z]+
number       [0-9]+
comops       <|>|!=|<=|>=|==|&&|"||"
mathops      \+|\-|\/|\*
inc	     "++"
dec	     "--"
comment      "#"(.*?)
space	     " "
colon	     ","
array        \[({number}{colon})*{number}?\]
dictionary   \{({identifier}\={number}{colon})*{identifier}\={number}\}
decimal      {number}+(\.{number}+)*	

%%

import 		   {printf("IMPORT ");}
do		   {printf("DO ");}
while		   {printf("WHILE ");}
for		   {printf("FOR ");}
if		   {printf("IF ");}
else		   {printf("ELSE ");}
elsif		   {printf("ELSEIF ");}
print   	   {printf("PRINT ");}
return		   {printf("RETURN ");}
;		   {printf("SEMICOLON ");}
try		   {printf("TRY ");}
catch 		   {printf("CATCH ");}
true		   {printf("TRUE ");}
false		   {printf("FALSE ");}
switch		   {printf("SWITCH ");}
case 		   {printf("CASE ");}
\{		   {printf("CURLYOPEN ");}
\}		   {printf("CURLYCLOSE ");}
\(		   {printf("OPENBRACKET ");}
\)		   {printf("CLOSEBRACKET ");}
\=		   {printf("EQUAL ");}
{inc}		   {printf("INCREMENT ");}
{dec}	           {printf("DECREMENT ");}
{colon}
{space}
{comops}	   {printf("COMPOPERATION ");}
{mathops}	   {printf("MATHOPERATION ");}
{word}		   {printf("WORD ");}
{comment}	   {printf("COMMENT ");}
{identifier}	   {printf("IDENTIFIER " );}
{number}	   {printf("NUMBER ");}
{decimal}	   {printf("DECIMAL ");}
{array}		   {printf("ARRAY ");}

append\({array}\)  |
clear\({array}\)   |
copy\({array}\)    |
count\({array}\)   |
extend\({array}\)  |
index\({array}\)   |
insert\({array}\)  |
pop\({array}\)     |
remove\({array}\)  |
reverse\({array}\) |
sort\({array}\)    {printf("ARRAYLIBRARY ");}

{dictionary}	   {printf("DICTIONARY ");}
\r        	
\n		   {printf("\n");}
.		   {printf("SYNTAXERROR ");}

%%

int main()
{
yyin = fopen("exampleprog.pin","r");
yylex();
return 0;
}
