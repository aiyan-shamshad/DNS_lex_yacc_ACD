## Overview
This project demonstrates a simplified DNS (Domain Name System) server that translates human-readable domain names (e.g., `www.google.com`) into machine-readable IP addresses (e.g., `142.250.64.78`). The implementation uses Lex (Lexical Analyzer Generator) and Yacc (Yet Another Compiler Compiler) to tokenize, parse, and resolve DNS queries programmatically.

## Features
- Tokenizes input URLs using Lex regex patterns
- Validates URL syntax using Yacc grammar rules
- Resolves domain names using a hardcoded DNS table
- Handles invalid URLs with "not found" messages

## Prerequisites
- `flex` (Lex) and `bison` (Yacc)
- C compiler (e.g., `gcc`)

## Installation
```bash
# Ubuntu/Debian
sudo apt-get install flex bison

# macOS (Homebrew)
brew install flex bison
```
## How to Run

1.Generate lexer and parser:
```bash
#flex dns.l
bison -d dns.y
```
2.Compile the code:
```bash
gcc lex.yy.c dns.tab.c -o dns_resolver
```
3.Execute the program:
```bash
./dns_resolver
```

## Usage Example
Enter URL:
www.google.com
IP: 142.250.64.78

Enter URL:
www.invalid.com
URL not found.

## Project Structure

| File    | Description                          |
|---------|--------------------------------------|
| `dns.l` | Lex file for tokenizing input URLs   |
| `dns.y` | Yacc file for parsing and DNS lookup |

## Future Enhancements

-  **Load DNS records from external files**  
  Replace hardcoded table with dynamic file loading (JSON/CSV)

-  **Add network socket support**  
  Implement basic UDP server to handle real DNS queries

-  **Support additional record types**  
  Add MX (Mail Exchange) and CNAME (Canonical Name) record support

-  **Performance optimization**  
  Implement hash tables for faster DNS lookups

-  **Cache system**  
  Add TTL-based caching for frequently queried domains
