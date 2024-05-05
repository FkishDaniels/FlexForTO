/* user code */

import java_cup.runtime.*;

//class Output {
//    public static void print(String token, String value) {
//        System.out.print(token + "(" + value + ")");
//    }
//
//
//}


%%



%public
%class Lexer
%line
%column
%cup


%eofval{
  return symbol(sym.EOF);
%eofval}
%{
     public static void print(String token, String value) {
             System.out.print(token + "(" + value + ")");
         }
%}

ALPHA=[A-Za-z]
DIGIT=[0-9]
NEWLINE=\r|\n|\r\n

WhiteSpace = {NEWLINE} | [   \t\f]
Semicolon = ;

INTEGER = -?{DIGIT}+

FOR = FOR
TO = TO
NEXT = NEXT
ENDFOR = ENDFOR
EQUALS = =
STEP = STEP
EXIT = EXIT
LOOP = LOOP
PLUS = \+
MINUS = -
TIMES = \*
DEVIDE = \/
IDENT = {ALPHA}({ALPHA}|{DIGIT}|_)*

%%

/* lexical rules */


{FOR} {print("FOR");}
{ENDFOR} {print("ENDFOR");}
{TO} {print("TO");}
{NEXT} {print("NEXT");}
{EQUALS} {print("EQUALS");}
{PLUS} {print("PLUS");}
{MINUS} {print("MINUS");}
{TIMES} {print("TIMES");}
{DEVIDE} {print("DIVIDE");}
{STEP} {return symbol(sym.STEP);}
{COMMANDS} {return symbol(sym.COMMANDS);}
{EXIT} {return symbol(sym.EXIT);}
{LOOP} {return symbol(sym.LOOP);}
{INTEGER} {return symbol(sym.INTEGER);}
{IDENT} {return symbol(sym.IDENT);}
{WhiteSpace} { /* ignore*/ }
[^] { throw new Error("Illegal character <"+yytext()+">"); }

