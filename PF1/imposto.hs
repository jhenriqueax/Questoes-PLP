import Text.Printf

imposto :: Float -> Float 
imposto x
    |  1903.99 >= x =  0.00
    |  1903.99 <= x && x < 2826.66 = (142.80 + ((x - 1903.99) * 0.075))
    |  2826.66 <= x && x < 3751.06 = (354.80 + ((x - 2826.66) * 0.15))
    |  3751.06 <= x && x < 4664.68 = (636.13 + ((x - 3751.06) * 0.225))
    |  otherwise = (869.36 + ((x - 4664.68) * 0.275))
    
    
salario :: Float -> Float
salario x = x - imposto x
    

main :: IO()
main = do
    input <- getLine
    let num1 = imposto(read input)
    let num2 = salario(read input)
    printf "O valor do imposto de renda retido eh R$ %.2f \n" num1
    printf "O salario liquido eh: R$ %.2f" num2