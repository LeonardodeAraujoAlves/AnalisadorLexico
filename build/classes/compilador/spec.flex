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

tipoNumerico = [0-9]+(\.[0-9]+)?
nomeVariavel = [_a-zA-Z][_a-zA-Z0-9]*
branco = [\t\r\n ]+
blocoComentario = "--[["~"]]--"
linhaComentario = "'-''-'"
atribuicao = "="
palavraChave = "if" |"while" | "do"|"function"
//nomeFuncao = nomeVariavel+["("]  falta implementar aqui

terminador = "end" | "break"

%%
= { imprimir("Operador de Atribuição", yytext()); return ATRIBUICAO; }
{palavraChave}          {imprimir ("PALAVRA-CHAVE",yytext()); return PALAVRA_CHAVE; }
{nomeVariavel}          {imprimir ("NOME_VARIAVEL",yytext()); return NOME_VARIAVEL; }
{tipoNumerico}               {imprimir ("TIPO NUMERICO",yytext()); return NUMBER; }
{blocoComentario}       {imprimir ("COMENTARIO(BLOCO)",yytext()); return COMENTARIO; }
{linhaComentario}       {imprimir ("COMENTARIO(LINHA)",yytext()); return COMENTARIO; }
{branco}                {return BRANCO; }
{terminador}            {imprimir("Terminador",yytext()); return TERMINADOR;}
.                       {imprimir ("<<CARACTERE INVÁLIDO>>  ",yytext()); return ERROR; }
<<EOF>>                 {return null;}
