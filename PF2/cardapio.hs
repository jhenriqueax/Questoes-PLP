import Control.Monad

produto :: String -> Int
produto valor 
    | valor == "cafe" = 4
    | valor == "pao" = 2
    | valor == "suco" = 5
    | valor == "pao de queijo" = 5
    | valor == "sanduiche" = 3
    | otherwise = 0
    
calcula :: IO ()
calcula = do
    entrada <- getLine
    let n = read entrada :: Int
    comidas <- replicateM n getLine
    let valores = map produto comidas
    print $ sum valores
    
main :: IO ()
main = calcula