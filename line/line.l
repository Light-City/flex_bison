%{
    #include <iostream>
    int chars = 0;
    int words = 0;
    int lines = 0;
    int nums = 0;
%}

%%
[a-zA-Z]+   { words++; chars += strlen(yytext); }

\n { chars++; lines++; }

[0-9] { nums++; }
[0-9]+ { nums+=yyleng; }

%%

int main() {
    yylex();
    /* ctrl+D */
    std::cout << "lines: " << lines << ", words = " << words 
              << ", chars = " << chars << ", nums = " << nums << std::endl;
}