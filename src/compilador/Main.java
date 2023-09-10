/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compilador;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import jflex.exceptions.SilentExit;

/**
 *
 * @author Frog33
 */
public class Main {
    
    public static void main(String[] args) throws FileNotFoundException, IOException{
        Lexer analisador = new Lexer(new BufferedReader(new FileReader("src\\compilador\\teste.txt")));
        while (true) {            
            Token token = analisador.yylex();
            if(token == null) break;
        }
    }
}
