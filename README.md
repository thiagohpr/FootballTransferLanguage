# FootballTransferLanguage

## Feito por Thiago Hampl de Pierri Rocha:

## Proposta - Here we Go!
A linguagem criada para esse projeto tem como motivação principal simular o mercado de transferências do Futebol.

## Estrutura da Linguagem:

``` 
PROGRAM = "Here we Go!", BLOCK, "End of Record"
BLOCK = { STATEMENT }
STATEMENT = (ASSIGN | PRINT | WHILE | IF | FUNCTION | RETURN | FUNCTIONCALL), "\n"

ASSIGN = IDENTIFIER "is", E(XPRESSION|CONDITION)
PRINT = "leak", "(", (EXPRESSION|CONDITION), ")"
WHILE = "as", "(", (EXPRESSION | CONDITION), ")", "begin conversation", "{", BLOCK, "}"
IF = "consider rumour", "(", (EXPRESSION |CONDITION), ")", "then", "{", BLOCK, "}", ["or else do","{", BLOCK, "}"]

FUNCTION  = "transference", VARIABLE, "receives", "(", [ IDENTIFIER, { ",", IDENTIFIER } ], ")", "{", { BLOCK }, "}"
RETURN = "complete transference", (EXPRESSION | CONDITION)
FUNCTIONCALL = VARIABLE, "(", [ VARIABLE, { ",", VARIABLE } ], ")"

CONDITION =  EXPRESSION, ( "==" | "!=" | ">" | "<" | ">=" | "<=" ), EXPRESSION

EXPRESSION = TERM, {("+" | "-"), TERM} 
TERM = FACTOR, {("*" | "/"), FACTOR} 
FACTOR = (("+" | "-"), FACTOR) | "(", EXPRESSION, ")" | VARIABLE | PLAYER | VALUE | DEAL

VARIABLE = LETTER, {CHAR}
IDENTIFIER = VTYPE, VARIABLE

PLAYER = '"', {CHAR | SPACE}, '"'
VALUE = DIGIT, {DIGIT} 
DEAL= "green" | "red"

VTYPE = "player" | "value" | "deal"

CHAR = LETTER | DIGIT
DIGIT = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
LETTER = "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" 
SPACE = " "
```


## Exemplo do uso da linguagem

```lua

Here we Go!

transference GetMostValuable receives (player Jogador1, player Jogador2, value Valor1, value Valor2){
    consider rumour (Valor1 > Valor2) then {
        player chosen is Jogador1
    }
    or else do{
        consider rumour (Valor2 > Valor1) {
            player chosen is Jogador2
        }
        or else do{
            player chosen is "Equals!"
        }
    }
    complete transference chosen
}

player Jogador1 is "Phillipe Coutinho"
value Valor1 is 135000000

player Jogador2 is "Ousmane Dembélé"
value Valor2 is 140000000

player MostValuable is GetMostValuable(Jogador1, Jogador2, Valor1, Valor2)
consider rumour (MostValuable == "Equals!"){
    leak("Equal Market Values!")
}
or else do {
    leak(MostValuable)
}

End of Record

```


