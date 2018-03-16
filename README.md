# compilers-study

Simple project to study compilers.

Based on:
- https://github.com/jengelsma/yacc-tutorial
- https://github.com/jengelsma/lex-tutorial
- https://gist.github.com/handrinp/0d1c006605f49ba61e51c5e7c427c46b

## Running

To run, simple type:
```bash
make run
```

or

```bash
make calc && ./calc
```

## Language
The goal of this repo is study how a compiler/interpreter work. The language is pretty simple,
and only supports math operations (for now):
```
sum = 1 + 4;
print sum;
Printing 5
exit;
```

## Goals
Create a simple calculator with YACC and Flex, for basic math operations:
- [x] Addition
- [x] Subtraction
- [x] Multiplication
- [x] Division
- [x] Exponentiation
- [ ] Square root
- And many others...
