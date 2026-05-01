--Ejercicio 1

max2(x, y) |x >= y = x
           |otherwise = y

--Eq, 

--Tipo Eq a => a -> a -> a 
-- Ord p => (p, p) -> p 


normalVectorial (x, y) = sqrt (x^2 + y^2)

-- Tipo FLoat -> Float -> Float , esto esta mal porque toma una tupla y no necesariamente Int



subtract = flip(-)

--  prelude Num a => a -> a -> a


predecesor = Main.subtract 1
-- Num a => a -> a
-- Integer -> Integer 
-- Estoy equivocado? Es integer porque subtract esta definido asi? 
--Integer -> Integer -> Integer según esta imple , segun imple de
evaluarEnCero = \f -> f 0 
-- Integer -> a -> a
-- (Integer -> t) -> t 
-- ?? t podria ser algo del estilo (Int -> Int), como si fuese un tipo adentro de otro.

dosVeces  = \f -> f . f
-- (b-> b) -> b -> b

flipAll = map flip 
-- map es (a -> b) -> [a] -> [b], ya tiene flip [a] -> [b] , donde a es "(c -> d -> e) -> d -> c"  y b es "e"
-- [a -> b -> c] -> [b -> a -> c] 
-- Porque es asi? No deberia ser como el mio, lo entre parentesis es lo que toma flip, la lista que se toma por map y devuelve una lista.


-- ????
--Seria correcto el siguiente razonamiento? queremos usar map que toma unas funcion y una lista.
-- la funcion es flip, entonces tenemos que pasarle una lista a map para que aplique flip a cada elemento de la lista
-- entonces va a tomar [a -> b -> c] y va devolver -> [b -> a -> c]

flipRaro = flip flip
-- flip sobre flip, para que devuelva los parametros cambiados de flip que se cambian con flip
-- a-> b -> c -> a -> b -> C
-- ?? Para preguntar 
---------------------------------------------------


--b

--subtract = flip (-)  , 
subtractCurry :: Num a => (a, a) -> a
subtractCurry (x,y) = flip (-) x y

--
dosVecesCurry (f, x) = (f.f) x 

-- ?? parentesis a izq porque es necesairo, porque es un operador binario

--flipAll ,toma un soloa rgumento.

--------------------------------- Ejercicio2 
uncurry :: (a-> b -> c) -> (a, b) -> c
uncurry f (x,y) = f x y

curry :: ((a,b)->c) -> a -> b -> c
curry f x y = f (x,y)

 
------------------- Ejercicio 3

sum1 :: [Int] -> Int
sum1 = foldr (+) 0 

elem1 e = foldr(\h r-> h == e || r ) False 
--asumo que r ya lo tengo, comparo el primer elemnto

--masmas l1 = flip(foldr(\x r ->x : r)) l1

--masmas = flip(foldr(\x r ->x : r ))

masmas2 :: [Int] -> [Int] -> [Int]
masmas2 = flip(foldr (:))

filter1 p = foldr(\x r -> if p x then x:r else r) []

map1 f = foldr(\x r -> f x : r) []

map2 f = foldr(\x r -> ((:) . f))

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f [x] = x
mejorSegun f (x:xs) = if f x (mejorSegun f xs)
                        then x
                        else mejorSegun f xs

mejorSegun1 f = foldr1(\x r -> if f x r then x else r)

sumasParciales :: [Int] -> [Int]
sumasParciales = foldl (\ac x-> ac ++ [sum1(ac) + x] ) []


sumaAlt (x:xs) =  sumaAltAux (x:xs) 0

sumaAltAux :: [Int] -> Int -> Int
sumaAltAux [] _ = 0
sumaAltAux (x:xs) n 
    |mod n 2 == 0 = x + sumaAltAux xs (n+1)
    |otherwise = -x + sumaAltAux xs (n+1)

sumaAltFR :: [Int] -> Int
sumaAltFR = foldr(-) 0

sumaAltInverso :: [Int] -> Int
sumaAltInverso = foldl (flip (-)) 0 
--[1 , 2, 3, 4] 
-- 1- 2 - 3 - (4 - 0)
-- = -2

-- Pendiente ultimo
--Ejercicio 4----------------------












--Ejercicio 5 ----------------

-- la primera no lo es porque esta usando xs por fuera de lo que es la recursion y aplica una funcion dentro del llamado recursivo
-- tampoco recursion primitiva porque esta usando tail xs


-- la segunda es estructural para x:xs y no es recursion para ys



-- Ejercicio 6
-- ?? porque la funcion f devuelve algo del tipo brecr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr f z _ = z
recr f z (x:xs) = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e = recr(\x xs r -> if(x== e) then xs else x : r) []


sacarUna1 :: Eq a => a -> [a] -> [a]
sacarUna1 e [] = []
sacarUna1 e (x:xs) = if e == x then xs else e : sacarUna1 e xs

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr(\x xs r -> if((x <e) && (head(xs) >= e)) then x:e:xs else x:r ) []


-- Ejercicio 7

--mapPares :: (a->b->c) -> [(a,b)] -> c
--mapPares f [] = []
--mapPares f (x:xs) = (Main.uncurry f x) : mapPares f xs

----------
-- Ejercicio 9
foldNat :: Integer-> (Integer-> Integer)-> Integer-> Integer 
foldNat z f 0 = z
foldNat z f a = f (foldNat z f (pred a))  

potencia :: Integer -> Integer -> Integer
potencia b = foldNat 1 (b*)   


-- Ejercicio 12
-- Queiro recorrer un arbol y aplicar una funcion

data AB a = Nil | Bin (AB a) a (AB a)

foldAB :: c->(c ->a ->c->c)->AB a->c
foldAB z f Nil = z
foldAB z f (Bin i r d)  = f (foldAB z f i) r (foldAB z f d) 

recAB :: c->(c-> a-> c-> AB a-> AB a->c) ->AB a -> c
recAB z f Nil = z
recAB z f (Bin i r d)  = f (recAB z f i) r (recAB z f d) i d

esNil :: AB a -> Bool
esNil Nil = True
esNil _ = False

altura :: AB a -> Integer
altura = foldAB 0 (\recI r recD->(max recI recD) + 1)

cantNodos :: AB a -> Integer
cantNodos = foldAB 0 (\recI r recD->recI +recD + 1)

{-
mejorSegun2 :: (a->a->Bool)-> AB a ->a
mejorSegun2 = foldAB Nil (\f recI r recD -> saveCaseNil r (saveCaseNil f recI recD))

saveCaseNil :: (a->a->Bool)->Maybe
saveCaseNil f Nil Nil = Nothing
saveCaseNil f a Nil = Just a
saveCaseNil f Nil b = Just b
saveCaseNil f a b =  if f a b then Just a else Just b
-}

mejorSegun3 :: (a->a->Bool)-> AB a -> a
mejorSegun3 f = recAB Nil (\recI r recD i d -> saveCaseNil f i r d recI recD) 

saveCaseNil :: (a->a->Bool)-> a ->a->a-> a 
saveCaseNil f Nil r Nil = r
saveCaseNil f Nil r recD = boolResult f r recD
saveCaseNil f recI r Nil = boolResult f r recI
saveCaseNil f recI r recD = boolResult f r (boolResult f recI recD) 

boolResult :: (a -> a-> Bool)->a -> a -> a
boolResult f a b = if f a b then a else b

esABB :: Ord a => AB a->Bool
esABB = recAB True (\recI r recD i d ->  menorOIgualAB r i && mayorAB r d && recD && recI)

menorOIgualAB :: Ord a => a -> AB a -> Bool
menorOIgualAB _ Nil = True
menorOIgualAB v (Bin l c r) = v >= c 

mayorAB :: Ord a => a -> AB a -> Bool
mayorAB _ Nil = True
mayorAB v (Bin l c r) = v < c 

--aca la justificaicon es porque neceisto i y d, primitiva


--------------------
--Ejercicio 15

-- ?? Why, Rose

data RoseTree a = Rose a [RoseTree a] --CONSTRUCTOR X CADA CASO BASE O AL REVES
 
-- si quiero devovler bool y tabajo con enteros no puedo, por eso b 
foldRose :: (a->[b]->b)->RoseTree a -> b
foldRose f (Rose a l) = f a (map (foldRose f) l)


-----
hojas :: RoseTree a -> [a]
hojas = foldRose(\r recu-> if null recu then [r] else concat recu) 

distancias ::RoseTree a -> [Integer]
distancias = foldRose(\r recu-> if null recu then [1] else map (+1) (concat recu)) 


alturaR :: (Num b, Ord b) =>RoseTree a-> b
alturaR = foldRose(\r recu-> if null recu then 1 else 1+ maximum recu)


------Ejercicio 18
paresDeNat::[(Int, Int)] 
paresDeNat = [(x,y)| n<-[0..] ,x<-[0..n], y<-[0..n],x + y == n ] 

------Ejercicio 20
--dado un numero natural yo tengo que devolver todas las listas de enteros positivios, cuya suma sea n
--1 -> [1] , 2 ->[1,1], [2] , 3->[1,1,1] [2, 1], [1,2] , [3] 
-- listasQueSuman


listasQueSuman :: Int -> [[Int]]
listasQueSuman 1 = [[1]]
listasQueSuman n = (concatMap (\x-> map (x:) (listasQueSuman(n - x)) ) [1..(n-1)]) ++ [[n]]

---------Ejercicio 21

-- Mi idea es hacer algo del estilo [listasQueSuman 1..]

