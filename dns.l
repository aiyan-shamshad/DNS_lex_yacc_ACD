%{
#include "dns.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%

[a-zA-Z0-9./:-]+    {
                        yylval.str = strdup(yytext);
                        return URL;
                    }

\n                  { return NEWLINE; }
.                   { /* Ignore everything else */ }

%%

int yywrap() {
    return 1;
}
