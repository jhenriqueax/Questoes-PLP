filtro :: String -> Bool
filtro x = length x > 3 

main :: IO()
main = do
    texto <- getLine
    let palavras = words texto
    let filtrado = (filter filtro palavras)
    print (unwords filtrado)

  

