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
