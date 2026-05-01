bisiesto :: Int -> Bool 
bisiesto n = ((mod n 4) == 0 && ((mod n 100) /= 0) || (mod n 400 == 0) )
