main :-
    read(List),
    read(Value),
    recursive(List, Value, '+'),
    halt.

calculate(A, B, Op, Resultado) :-
    (Op = '+' -> Resultado is A + B;
     Op = '-' -> Resultado is A - B;
     Op = '*' -> Resultado is A * B;
     Op = '/' -> (B =\= 0 -> Resultado is A / B; Resultado is A / 1)).

recursive([], A, '-') :-
    write(A).

recursive([Head|Tail], Value, Op) :-
    (Op = '+' ->
        calculate(Value, Head, Op, Resultado),
        recursive(Tail, Resultado, '');
     Op = '-' ->
        calculate(Value, Head, Op, Resultado),
        recursive(Tail, Resultado, '*');
     Op = '*' ->
        calculate(Value, Head, Op, Resultado),
        recursive(Tail, Resultado, '/');
     Op = '/' ->
        calculate(Value, Head, Op, Resultado),
        recursive(Tail, Resultado, '+')).

