import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        //ComplexSymbolFactory csf = new ComplexSymbolFactory();
        try {
            parser p = new parser(new Lexer(new FileReader(args[0])));
            Object result = p.parse().value;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

