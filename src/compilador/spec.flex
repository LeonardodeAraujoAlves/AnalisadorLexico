package compilador;
import static compilador.Token.*;

%%

%{
    private void imprimir(String token, String lexema){
        System.out.println(lexema + " ===>> " + token);
    }
%}

%class Lexer
%type Token

nomeVariavel = [_a-zA-Z][_a-zA-Z0-9]*
decimal = [0-9]+["."]+[0-9]+
//tipoNumerico = [0-9]+["."]+[0-9]+

branco = [\t\r\n ]+
blocoComentario = "--[["~"]]--"
linhaComentario = "--"
palavraChave = "if" |"while" | "do"|"function"
//nomeFuncao = nomeVariavel+["("] 
concatenacao = ".."
terminador = "end" | "break"

%%

{palavraChave}          {imprimir ("PALAVRA-CHAVE",yytext()); return PALAVRA_CHAVE; }
{nomeVariavel}          {imprimir ("NOME_VARIAVEL",yytext()); return NOME_VARIAVEL; }
{inteiro}               {imprimir ("NUMERO INTEIRO",yytext()); return INT; }
{decimal}               {imprimir ("NUMERO DECIMAL",yytext()); return DEC; }
{blocoComentario}       {imprimir ("COMENTARIO(BLOCO)",yytext()); return COMENTARIO; }
{linhaComentario}       {imprimir ("COMENTARIO(LINHA)",yytext()); return COMENTARIO; }
{branco}                {return BRANCO; }
{contatenacao}          {imprimir ("Concatenacao",yytext()); return CONCATENACAO}
{terminador}            {imprimir("Terminador",yytext()); return TERMINADOR}
.                       {imprimir ("<<CARACTERE INVÁLIDO>>  ",yytext()); return ERROR; }
<<EOF>>                 {return null;}
