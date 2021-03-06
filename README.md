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

## Language
The goal of this repo is study how a compiler/interpreter work. The language is pretty simple,
and only supports math operations (for now):

```
sum = 2 * (4 + 2);
calc sum;
result: 12
exit;
```

## Goals
Create a simple calculator with YACC and Lex, for basic math operations:
- [x] Addition (`+`)
- [x] Subtraction (`-`)
- [x] Multiplication (`*`)
- [x] Division (`/`)
- [x] Exponentiation (`^`)
