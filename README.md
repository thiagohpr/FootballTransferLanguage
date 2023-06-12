# FootballTransferLanguage

## Feito por Thiago Hampl de Pierri Rocha:

## Proposta - Here we Go!
A linguagem criada para esse projeto tem como motivação principal simular o mercado de transferências do Futebol.

## Estrutura da Linguagem:

``` 
PROGRAM = "Here_we_Go!", BLOCK, "End_of_Record"
BLOCK = { STATEMENT }
STATEMENT = (ASSIGN | CREATING | PRINT | WHILE | IF | FUNCTION | RETURN | FUNCTIONCALL), "\n"

ASSIGN = IDENTIFIER, "is", (EXPRESSION|CONDITION)
CREATING = TYPE, IDENTIFIER, ["is", (EXPRESSION|CONDITION)]

PRINT = "leak", "(", (EXPRESSION|CONDITION), ")"
WHILE = "begin_conversation", "(", (EXPRESSION | CONDITION), ")",  "{", BLOCK, "}"
IF = "consider_rumour", "(", (EXPRESSION |CONDITION), ")", "then", "{", BLOCK, "}", ["or_else_do","{", BLOCK, "}"]

FUNCTION  = "begin_transference", VARIABLE, "(", [ IDENTIFIER, { ",", IDENTIFIER } ], ")", "{", { BLOCK }, "}"
RETURN = "complete_transference", (EXPRESSION | CONDITION)
FUNCTIONCALL = VARIABLE, "(", [ VARIABLE, { ",", VARIABLE } ], ")"

CONDITION =  EXPRESSION, ( "==" | "!=" | ">" | "<" | ">=" | "<=" ), EXPRESSION

EXPRESSION = TERM, {("+" | "-"), TERM} 
TERM = FACTOR, {("*" | "/"), FACTOR} 
FACTOR = (("+" | "-"), FACTOR) | "(", EXPRESSION, ")" | VARIABLE | PLAYER | VALUE

VARIABLE = LETTER, {CHAR}
IDENTIFIER = VTYPE, VARIABLE

PLAYER = '"', {CHAR | SPACE}, '"'
VALUE = DIGIT, {DIGIT} 

VTYPE = "player" | "value"

CHAR = LETTER | DIGIT
DIGIT = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
LETTER = "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" 
SPACE = " "
```


## Exemplo do uso da linguagem

```lua

Here_we_Go

begin_transference GetMostValuable (player Jogador1, player Jogador2, value Valor1, value Valor2){
    consider_rumour (Valor1 > Valor2) {
        player chosen is Jogador1
    }
    or_else_do{
        consider_rumour (Valor2 > Valor1) {
            player chosen is Jogador2
        }
        or_else_do{
            player chosen is "Equals!"
        }
    }
    complete_transference chosen
}

player Jogador1 is "Phillipe Coutinho"
value Valor1 is 135000000

player Jogador2 is "Ousmane Dembélé"
value Valor2 is 140000000

player MostValuable is GetMostValuable(Jogador1, Jogador2, Valor1, Valor2)
consider_rumour (MostValuable == "Equals!"){
    leak("Equal Market Values!")
}
or_else_do {
    leak(MostValuable)
}

End_of_Record

```


