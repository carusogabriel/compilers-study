clean:
	rm -rf calc y.tab.* lex.yy.c

run: calc
	./calc

calc: build_lexer build_parser
	gcc lex.yy.c y.tab.c -lm -o calc

build_parser:
	yacc -d calc.y

build_lexer:
	lex calc.l
