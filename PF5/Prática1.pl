:- initialization(main).

main :-
    write("Entrada: "),
    read(X),
    write("Saida: "),
    nl,
    write("Floor de "),
    write(X),
    write(" = "),
    get_floor(X, ResultadoF),
    write(ResultadoF),
    nl,
    write("Ceiling de "),
    write(X),
    write(" = "),
    get_ceiling(X, ResultadoC),
    write(ResultadoC),
    nl,
    write("Abs de "),
    write(X),
    write(" = "),
    get_abs(X, ResultadoA),
    write(ResultadoA),
    nl,
    halt.

get_floor(X, Result) :-
    Result is floor(X).

get_ceiling(X, Result) :-
    Result is ceiling(X).

get_abs(X, Result) :-
    Result is abs(X).
