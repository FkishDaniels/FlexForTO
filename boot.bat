@echo off
REM some variables
::set java_dir=C:\
::set classes_dir=C:\
::set main_dir=C:\

if not defined java_dir set java_dir=C:\Users\Daniil\Desktop\homeWork\java
if not defined main_dir set main_dir=C:\Users\Daniil\Desktop\homeWork
if not defined classes_dir set classes_dir=C:\Users\Daniil\Desktop\homeWork\classes

cd %main_dir%

REM create directory for logs
md logs
REM create flex files (исп. call, т.к. вызываем другой батник, иначе прервется выполнение)
call jflex Lexer.flex -d %java_dir% > logs/log_jflex.txt 2>&1

REM create cup files
REM set -expect [conflicts] 4232, чтобы все равно генерировать код парсера, ибо столько конфилктов генерится, когда ставим пустые правила справа для
REM ключевых нетерминалов типа exprlIst, for, while, scope, etc. Такие пустые терминалы справа требуются для корректной обработки
REM команд, которые имеют не все возможные правила. Например, где отсутствует часть с for или while
REM Данные конфликты не мешают остальной части синтаксического анализа
java -jar java-cup-11b.jar -expect 4236 -destdir %java_dir% Parser.cup > logs/log_java_cup.txt 2>&1

REM compile
javac -sourcepath %java_dir% -d %classes_dir% -cp java-cup-11b.jar %java_dir%\parser.java %java_dir%\sym.java > logs/log_compile_parser.txt 2>&1
javac -sourcepath %java_dir% -d %classes_dir% -cp java-cup-11b.jar %java_dir%\Lexer.java > logs/log_compile_lexer.txt 2>&1
javac -sourcepath %java_dir% -d %classes_dir% -cp java-cup-11b.jar %java_dir%\Main.java > logs/log_compile_main.txt 2>&1

REM run. Results put in logs/log_run.txt
REM run tests without syntax errors
md tests\logs
java -classpath %classes_dir%;java-cup-11b.jar Main tests\test.txt > tests\logs\log_no_errors_tests.txt 2>&1
REM run tests with errors
java -classpath %classes_dir%;java-cup-11b.jar Main tests/error_tests/et1.txt > tests/logs/errors_tests.txt 2>&1
java -classpath %classes_dir%;java-cup-11b.jar Main tests/error_tests/et2.txt >> tests/logs/errors_tests.txt 2>&1
java -classpath %classes_dir%;java-cup-11b.jar Main tests/error_tests/et3.txt >> tests/logs/errors_tests.txt 2>&1

REM clean
REM cd %java_dir%
REM del sym.java
REM del parser.java
REM del Lexer.java
cd %classes_dir%
REM cd %main_dir%
::del logs/log_*.txt
