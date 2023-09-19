package compilador;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import jflex.exceptions.SilentExit;

/**
 *
 * @author Leonardo de Araujo Alves
 */
public class Main {
    
    public static void main(String[] args) throws FileNotFoundException, IOException, SilentExit{
        /*
        String[]arg = new String[1];
        arg[0] = "src\\compilador\\spec.flex";
        jflex.Main.generate(arg);
        */
        
        LuaLexer analisador = new LuaLexer(new BufferedReader(new FileReader("src\\compilador\\teste.txt")));
        while (true) {            
            Token token = analisador.yylex();
            if(token == null) break;
        }
        
    }
}
