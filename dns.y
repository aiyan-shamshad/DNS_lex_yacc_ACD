%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_ENTRIES 5

typedef struct {
    char *url;
    char *ip;
} DNSRecord;

DNSRecord dns_table[MAX_ENTRIES] = {
    {"www.example.com", "192.168.1.1"},
    {"www.google.com", "142.250.64.78"},
    {"www.openai.com", "104.18.12.123"},
    {"www.github.com", "140.82.114.4"},
    {"www.stackoverflow.com", "151.101.65.69"}
};

void lookup(char *url);
void yyerror(const char *s);
int yylex(void);
%}

%union {
    char *str;
}

%token <str> URL
%token NEWLINE

%%

input:
    | input line
    ;

line:
    URL NEWLINE {
        lookup($1);
        free($1);
        printf("\nEnter another URL or press Ctrl+C to exit:\n");
    }
    ;

%%

void lookup(char *url) {
    for (int i = 0; i < MAX_ENTRIES; i++) {
        if (strcmp(dns_table[i].url, url) == 0) {
            printf("IP Address: %s\n", dns_table[i].ip);
            return;
        }
    }
    printf("URL not found in DNS records.\n");
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter a URL:\n");
    fflush(stdout);
    return yyparse();
}
