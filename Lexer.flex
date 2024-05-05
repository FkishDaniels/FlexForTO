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
     private Symbol symbol(int type) {
            return new Symbol(type, yyline, yycolumn);
        }

        private Symbol symbol(int type, Object value) {
            return new Symbol(type, yyline, yycolumn, value);
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


{FOR} {return symbol(sym.FOR);}
{ENDFOR} {return symbol(sym.ENDFOR);}
{TO} {return symbol(sym.TO);}
{NEXT} {return symbol(sym.NEXT);}
{EQUALS} {return symbol(sym.EQUALS);}
{PLUS} {return symbol(sym.PLUS);}
{MINUS} {return symbol(sym.MINUS);}
{TIMES} {return symbol(sym.TIMES);}
{DEVIDE} {return symbol(sym.DEVIDE);}
{STEP} {return symbol(sym.STEP);}
{EXIT} {return symbol(sym.EXIT);}
{LOOP} {return symbol(sym.LOOP);}
{INTEGER} {return symbol(sym.INTEGER);}
{IDENT} {return symbol(sym.IDENT);}
{WhiteSpace} { /* ignore*/ }
[^] { throw new Error("Illegal character <"+yytext()+">"); }

