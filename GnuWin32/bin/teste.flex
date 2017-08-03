/*definicoes*/

%{
#undef yywrap
#define yywrap() 1
#include "stdio.h"
%}

digito [0-9]
inteiro {digito}+
decimal {inteiro}("."){inteiro}
letra [a-z]|[A-Z]
variavel x|y|z
operador "+"|"-"|"*"|"/"
exponencial "^"
parentese "("|")"
virgula ","
ponto "."
espaco " "

%% /*Regras----------------------------------------------------------------------*/

(("f(x)")|("f(x,y)")|("f(x,y,z)"))   	{printf("<declaracao> ");}
({inteiro}) 						    {printf("<inteiro> ");}
({decimal}) 							{printf("<decimal> ");}
(("x")|("y")|("z"))						{printf("<variavel> ");}
(("U")|("V")|("W"))						{printf("<vetor> ");}
({letra})								{printf("<constante> ");}
("=")									{printf("<igualdade> ");}
({operador})							{printf("<operador> ");}
({exponencial})							{printf("<exponencial> ");}
({parentese})							{printf("<parentese> ");}
({virgula})								{printf("<separador> ");}
({espaco})								{printf("");}
({ponto})								{printf("<ponto> ");}

%% /*----------------------------------------------------------------------*/

/*funcoes*/

int main()
{
  printf("Give me your input:\n");
  yylex();
  return 0;
}
