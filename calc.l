%{
    #include "y.tab.h"

    extern int yyerror();
%}

%%
"calc"                     { return calc; }
"exit"                     { return exit_command; }
[a-zA-Z_][a-zA-Z0-9_]*     {
    yylval.id = yytext[0];
    return identifier;
}
[0-9]+                     {
    yylval.num = atoi(yytext);
    return number;
}
[ \t\n\f\v]                 { ; }
[-+*/^()=;]                 { return yytext[0]; }
.                           {
    ECHO;
    yyerror("Unexpected character.");
}
%%

int yywrap()
{
    return 1;
}
