package compilador;
import static compilador.Token.*;

%%

%{
    private void imprimir(String token, String lexema){
        System.out.println(lexema + " ===>> " + token);
    }
%}

%class LuaLexer
%type Token

terminador = "end" | "break"
tipoNumerico = [0-9]+(\.[0-9]+)?
nomeVariavel = [_a-zA-Z][_a-zA-Z0-9]*
string =  \"[^\"\n]*\" 
branco = [\t\r\n ]+
est_condicional = "if"|"then"|"else"|"elseif"
blocoComentario = "--[["~"]]--"
linhaComentario = "'-''-'"
atribuicao = "="
est_repeticao = "while" | "do"
lista = "[" [^\[\]]* "]" 
vetor = "{" [^{}]* "}" 
terminador = "end" | "break"

%%
= { imprimir("Operador de Atribuição", yytext()); return ATRIBUICAO; }
{est_repeticao}          {imprimir ("Estrutura de repetição ",yytext()); return EST_REPET; }
{nomeVariavel}          {imprimir ("NOME_VARIAVEL",yytext()); return NOME_VARIAVEL; }
{string}                {imprimir("Cadeia de caracteres",yytext()); return STRING;}
{est_condicional}       {imprimir("Estrutura condicional",yytext()); return EST_COND;}
{tipoNumerico}          {imprimir ("TIPO NUMERICO",yytext()); return NUMBER; }
{blocoComentario}       {imprimir ("COMENTARIO(BLOCO)",yytext()); return COMENTARIO; }
{linhaComentario}       {imprimir ("COMENTARIO(LINHA)",yytext()); return COMENTARIO; }
{branco}                {return BRANCO; }
{terminador}            {imprimir("Terminador",yytext()); return TERMINADOR;}
{lista}                 {imprimir("Tipo: Lista",yytext()); return LISTA;}
{vetor}                 {imprimir("Tipo: Vetor",yytext()); return VETOR;}
.                       {imprimir ("<<CARACTERE INVÁLIDO>>  ",yytext()); return ERROR; }
<<EOF>>                 {return null;}