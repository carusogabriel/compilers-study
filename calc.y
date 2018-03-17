%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    #include <math.h>

    void yyerror(char *message);
    int symbolVal(char symbol);
    void updateSymbolVal(char symbol, int value);

    int symbols[52]; // a-zA-Z
    extern int yylex();
%}

%union {
    int num;
    char id;
}

%token calc
%token exit_command

%token <num>   number
%token <id>    identifier

%type <num>    line statement exp factor term
%type <id>     assignment

%%
line :
    statement ';'           { ; }
    | line statement ';'    { ; }
;

statement :
    assignment                    { ; }
    | exit_command                { exit(EXIT_SUCCESS); }
    | calc exp                    { $$ = printf("result: %d\n", $2); }
;

assignment :
    identifier '=' exp      { updateSymbolVal($1, $3); }
;

exp :
    factor                  { $$ = $1; }
    | exp '+' factor        { $$ = $1 + $3; }
    | exp '-' factor        { $$ = $1 - $3; }
;

factor :
    term                    { $$ = $1; }
    | factor '*' term       { $$ = $1 * $3; }
    | factor '/' term       { $$ = $1 / $3; }
    | factor '^' term       { $$ = pow($1, $3); }
;

term :
    number                  { $$ = $1; }
    | '(' exp ')'           { $$ = $2; }
    | identifier            { $$ = symbolVal($1); }
;
%%

int computeSymbolIndex(char token)
{
    int index = -1;

    if (islower(token)) {
        index = token - 'a' + 26;
    } else {
        index = token - 'A';
    }

    return index;
}

int symbolVal(char symbol)
{
    return symbols[computeSymbolIndex(symbol)];
}

void updateSymbolVal(char symbol, int value)
{
    symbols[computeSymbolIndex(symbol)] = value;
}

int main()
{
    int i = 0;

    for (i = 0; i < 52; ++i) {
        symbols[i] = 0;
    }

    return yyparse();
}

void yyerror(char *message)
{
    fprintf(stderr, "%s\n", message);
}
