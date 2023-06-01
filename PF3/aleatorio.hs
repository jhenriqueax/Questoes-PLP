import Text.Printf

quantasVezes :: [Int] -> Int -> Int
quantasVezes [] n = 0
quantasVezes (x:xs) n = if x == n then 1 + quantasVezes xs n
                        else quantasVezes xs n

contaTodos :: [Int] -> IO ()
contaTodos [] = return ()
contaTodos (x:xs) = do
    printf "%d foi sorteado %d vez(es)\n" x (quantasVezes (x:xs) x)
    contaTodos (filter (/=x) xs)

main :: IO ()
main = do
    input <- getLine
    let numeros = read input :: [Int]
    if null numeros then putStrLn "nenhum numero foi sorteado"
    else contaTodos numeros


