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

%token print
%token exit_command

%token <num>   number
%token <id>    identifier

%type <num>    line statement exp term
%type <id>     assignment

%%
line :
    statement semicolon           { ; }
    | line statement semicolon    { ; }
;

statement :
    assignment                    { ; }
    | exit_command                { exit(EXIT_SUCCESS); }
    | print exp                   { $$ = printf("Printing %d\n", $2); }
;

assignment :
    identifier '=' exp      { updateSymbolVal($1, $3); }
;

exp :
    term                    { $$ = $1; }
    | exp '+' term          { $$ = $1 + $3; }
    | exp '-' term          { $$ = $1 - $3; }
    | exp '*' term          { $$ = $1 * $3; }
    | exp '/' term          { $$ = $1 / $3; }
    | exp '^' term          { $$ = pow($1, $3); }
;

semicolon :
    ';'                     { ; }
;

term :
    number                  { $$ = $1; }
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
