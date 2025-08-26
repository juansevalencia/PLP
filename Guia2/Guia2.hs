--Ejercicio 1

max2(x, y) |x >= y = x
           |otherwise = y

--Tipo Eq a => a -> a -> a 
-- Ord p => (p, p) -> p 
--Porque no es el primero que dije? Cuando nos preguntan el tipo tenemos que especificar que es Eq a?Cual es la forma correcta de decirlo?

normalVectorial (x, y) = sqrt (x^2 + y^2)

-- Tipo Int -> Int -> Int , esto esta mal porque toma una tupla y no necesariamente Int
-- Floating a => (a, a) -> a 
-- =El floating me va dice que es de tipo Float a? Porque directamente no lo ponemos en vez de a? 

subtract = flip(-)
-- Op a -> a -> a -> a
-- Integer -> Integer -> Integer según esta imple , segun imple de prelude Num a => a -> a -> a
-- ?Flip espera dos argumentos mas y simplemente estoy dejando abierta la entrada de 2 argumento no?
-- ?Como hago para ver la implemenntacion de subtract en el prelude?
-- ?Existe Op ? Operacional ()

predecesor = Main.subtract 1
-- Num a => a -> a
-- Integer -> Integer 
-- Estoy equivocado? Es integer porque subtract esta definido asi? 

evaluarEnCero = \f -> f 0
-- 
-- (Integer -> t) -> t 

dosVeces  = \f -> f . f
-- a -> a
-- (b-> b) -> b -> b
-- ?porque no a -> a, entiendo que f toma un argumento poruq ees una funcion pero porque no se le debe llamar por a-> a

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
-- a-> b -> c -> a -> b -> c
-- ?? porque esta mal?

---------------------------------------------------

-- Ejercicio 2
--a) curry, 