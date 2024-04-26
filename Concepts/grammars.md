# Context-Free Grammars

## Syntax of `for`structure in C

Example:
```c

++i
i++
i+=1
i=i+1
i=1+i

for (int i=0; i<10; i++) {
    ...
}

for (;;)
    printf("Cool!");
```

BNF:
```xml
<for> ::= for (<init>; <condition>; <update>) <expression>
          | for (<init>; <condition>; <update>) { <expressions> }
<init> ::= <type> <var> = <value> | <var> = <value> | <lambda>
<condition> ::= <expression> | <lambda>
<update> ::= <var><update-operator> | <update-operator><var>
<update-operator> ::= ++ | --

<expressions> ::= <expression> | <expression><expressions>
```

EBNF:
```bash
FOR ::= 'for' '(' INIT ';' CONDITION ';' UPDATE ')' ( EXPRESSION | '{' { EXPRESSION } '}' )

```


## Syntax of `if/elif/else` in Python

Examples:
```python
if true:
    print("hello")
else:
    print("nothing")

if a < b:
    a++
    b++
    c++

if a > 20:
    print("large")
elif a > 5:
    print("medium")
elif a > 2:
    print("small")
else:
    print("none")

# Is this valid?
if a < 7:
    print("ok")
else:
    print("what?")
elif a < 18:
    print("aspodfinwe")
else a < 20:
    print("does this work?")
```

BNF:
```xml
<conditional> ::= <if> | <if><else> | <if><elifs> | <if><elifs><else>
<if> ::= if <expression>: \n \t<expressions>
<elifs> ::= <elif> | <elif><elifs>
<elif> ::= elif <expression>: \n \t<expressions>
<else> ::= else: \n \t <expressions>
<expresssions> ::= <expression> | <expression><expressions>
```

EBNF:
```bash
CONDITIONAL ::= IF [{ELIF}] [ELSE]
IF ::= 'if' EXPRESSION':' '\n' '\t' {EXPRESSION}
ELIF ::= 'elif' EXPRESSION':' '\n' '\t' {EXPRESSION}
ELSE ::= 'else:' '\n' '\t' {EXPRESSION}
```
