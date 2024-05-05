# Изменение
## Обновил CUP

terminal FOR,NEXT,TO,EQUALS,STEP,COMMANDS,INTEGER,ENDFOR,IDENT,WhiteSpace,Semicolon,EXIT,LOOP,PLUS,MINUS,TIMES,DEVIDE;<br>


/** Non-terminals **/<br>


non terminal s,step,exit,next,loop,params,commands,expression,termin,expressionMain,expression2,identOrInteger;



start with s;

/** ============= GRAMMAR ============= */<br>
params::= IDENT EQUALS INTEGER TO INTEGER step expression2 exit loop;<br>
s ::= FOR params next | s FOR params next;<br>
expression ::= INTEGER | expression PLUS expression<br>
               | expression MINUS expression<br>
               | expression TIMES expression<br>
               | expression DEVIDE expression;<br>
expression2 ::= | IDENT EQUALS expression;<br>
next ::= ENDFOR|NEXT;<br>
step ::= | STEP INTEGER;<br>
exit ::= | EXIT;<br>
loop ::= | LOOP;<br>

## ОБНОВИЛ FLEX
ALPHA=[A-Za-z]<br>
DIGIT=[0-9]<br>
NEWLINE=\r|\n|\r\n<br>

WhiteSpace = {NEWLINE} | [   \t\f]<br>
Semicolon = ;<br>

INTEGER = -?{DIGIT}+<br>

FOR = FOR<br>
TO = TO<br>
NEXT = NEXT<br>
ENDFOR = ENDFOR<br>
EQUALS = =<br>
STEP = STEP<br>
EXIT = EXIT<br>
LOOP = LOOP<br>
PLUS = \+<br>
MINUS = -<br>
TIMES = \*<br>
DEVIDE = \/<br>
IDENT = {ALPHA}({ALPHA}|{DIGIT}|_)*<br>

%%<br>

/* lexical rules */<br>


{FOR} {return symbol(sym.FOR);}<br>
{ENDFOR} {return symbol(sym.ENDFOR);}<br>
{TO} {return symbol(sym.TO);}<br>
{NEXT} {return symbol(sym.NEXT);}<br>
{EQUALS} {return symbol(sym.EQUALS);}<br>
{PLUS} {return symbol(sym.PLUS);}<br>
{MINUS} {return symbol(sym.MINUS);}<br>
{TIMES} {return symbol(sym.TIMES);}<br>
{DEVIDE} {return symbol(sym.DEVIDE);}<br>
{STEP} {return symbol(sym.STEP);}<br>
{EXIT} {return symbol(sym.EXIT);}<br>
{LOOP} {return symbol(sym.LOOP);}<br>
{INTEGER} {return symbol(sym.INTEGER);}<br>
{IDENT} {return symbol(sym.IDENT);}<br>
{WhiteSpace} { /* ignore*/ }<br>
[^] { throw new Error("Illegal character <"+yytext()+">"); }<br>
