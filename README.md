# Изменение
## Обновил CUP

terminal FOR,NEXT,TO,EQUALS,STEP,COMMANDS,INTEGER,ENDFOR,IDENT,WhiteSpace,Semicolon,EXIT,LOOP,PLUS,MINUS,TIMES,DEVIDE;


/** Non-terminals **/


non terminal s,step,exit,next,loop,params,commands,expression,termin,expressionMain,expression2,identOrInteger;



start with s;

/** ============= GRAMMAR ============= */
params::= IDENT EQUALS INTEGER TO INTEGER step expression2 exit loop;
s ::= FOR params next | s FOR params next;
expression ::= INTEGER | expression PLUS expression
               | expression MINUS expression
               | expression TIMES expression
               | expression DEVIDE expression;
expression2 ::= | IDENT EQUALS expression;
next ::= ENDFOR|NEXT;
step ::= | STEP INTEGER;
exit ::= | EXIT;
loop ::= | LOOP;

## ОБНОВИЛ FLEX
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
