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
inteiro = [0-9]+
decimal = [0-9]+["."]+[0-9]+
branco = [\t\r\n ]+
blocoComentario = "/*" ~"*/"
linhaComentario = {branco}* "//" .*
palavraChave = "if" | "class" | "int" | "while" | "do"
%%

{palavraChave}          {imprimir ("PALAVRA-CHAVE",yytext()); return PALAVRA_CHAVE; }
{nomeVariavel}          {imprimir ("NOME_VARIAVEL",yytext()); return NOME_VARIAVEL; }
{inteiro}               {imprimir ("NUMERO INTEIRO",yytext()); return INT; }
{decimal}               {imprimir ("NUMERO DECIMAL",yytext()); return DEC; }
{blocoComentario}       {imprimir ("COMENTARIO(BLOCO)",yytext()); return COMENTARIO; }
{linhaComentario}       {imprimir ("COMENTARIO(LINHA)",yytext()); return COMENTARIO; }
{branco}                {return BRANCO; }
.                       {imprimir ("<<CARACTERE INVÁLIDO>>  ",yytext()); return ERROR; }
<<EOF>>                 {return null;}
