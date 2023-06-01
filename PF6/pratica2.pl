:- dynamic contadorP/2, contadorM/2, contadorG/2, preco/1, total/1.
:- initialization(main).

contadorP(0, 0).
contadorM(0, 0).
contadorG(0, 0).
preco(1).
total(1).

main :-
    read(Valor),
    retractall(preco(_)),
    assertz(preco(Valor)),
    loop.

loop :-
    read(Size),
    process_input(Size).

process_input(-1) :-
    calcular_desconto(Desconto),
    obter_valor_preco(Preco),
    obter_valor_total(ValorTotal),
    PrecoTot is ValorTotal * Preco,
    Porcentagem is Desconto / 100,
    Resultado is PrecoTot - (PrecoTot * Porcentagem),
    write(Resultado), nl,
    halt.

process_input(Size) :-
    incrementar_contador(Size),
    loop.

incrementar_contador(p) :-
    retract(contadorP(Valor, Desconto)),
    NovoValor is Valor + 1,
    (NovoValor >= 4 -> NovoDesconto is 8 ; NovoDesconto is Desconto),
    asserta(contadorP(NovoValor, NovoDesconto)).

incrementar_contador(m) :-
    retract(contadorM(Valor, Desconto)),
    NovoValor is Valor + 1,
    (NovoValor >= 4 -> NovoDesconto is 6 ; NovoDesconto is Desconto),
    asserta(contadorM(NovoValor, NovoDesconto)).

incrementar_contador(g) :-
    retract(contadorG(Valor, Desconto)),
    NovoValor is Valor + 1,
    (NovoValor >= 4 -> NovoDesconto is 4 ; NovoDesconto is Desconto),
    asserta(contadorG(NovoValor, NovoDesconto)).

obter_valor_preco(Valor) :-
    preco(Valor),
    !.

obter_valor_total(ValorTotal) :-
    total(ValorTotal),
    !.

calcular_desconto(Desconto) :-
    contadorP(ValorP, DescontoP),
    contadorM(ValorM, DescontoM),
    contadorG(ValorG, DescontoG),
    TotalCamisas is ValorP + ValorM + ValorG,
    retractall(total(_)),
    assertz(total(TotalCamisas)),
    TotalDesconto is DescontoP + DescontoM + DescontoG,
    (TotalCamisas >= 4 -> Desconto is TotalDesconto ; Desconto is 0).
