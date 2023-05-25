%{
# include "cal_parser.hpp"
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[ \t]   { /* ignore whitespace */ }
\n     { return EOL; }
%%