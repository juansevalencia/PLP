cantDivisoresPrimos :: Int -> Int 
cantDivisoresPrimos n = cantDivisoresPrimosAux n n


cantDivisoresPrimosAux :: Int -> Int -> Int
cantDivisoresPrimosAux 1 _ = 0
cantDivisoresPrimosAux _ 1 = 0
cantDivisoresPrimosAux n = divideYEsPrimo n n-1 + cantDivisoresPrimosAux n n-1

divideYEsPrimo :: Int -> Int -> Int 
divideYEsPrimo n m
|esPrimo(m) && (mod n m == 0) = 1
| otherwise = 0

esPrimo :: Int -> Bool
esPrimo 0 = False
esPrimo 1 = False
esPrimo n = noDivideAlgunoMenor n n-1


noDivideAlgunoMenor :: Int -> Bool
noDivideAlgunoMenor _ 1 = 
noDivideAlgunoMenor n m 
|mod n m == 0 = True
