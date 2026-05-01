import Distribution.SPDX (LicenseId(BSD_2_Clause))
prod :: Int-> Int-> Int
prod x y = x*y

doble:: Int->Int
doble = prod 2

esMayorDeEdad :: Int->Bool
esMayorDeEdad = (<) 65

comp :: (a-> b) -> (c->a)-> c -> b
comp f1 f2 = \x -> f1 (f2 x)

flip :: (a -> b -> c) -> b -> a -> c
flip = (\f b a -> f a b)

($) :: (a->b) -> a ->b
($) f a = f a 

nidea :: [Int]
nidea = [x| x <- [1..3], y <- [x..3],mod (x + y) 3 == 0 ]

paresDeNat :: [(Int,Int)]
paresDeNat = [(x,y)| z <- [0..],x <- [0..z], y<-[0..z], z == (x+y)]

pitagoricas :: [(Integer,Integer, Integer)]
pitagoricas = [(a,b,c) | c<-[1..], b<-[1..c], a<-[1..b], a^2 + b^2 == c^2]

zip :: [a] -> [b] -> [(a, b)]
zip = foldr (\x rec (y:ys) -> (x,y) : (rec)) (\l -> if l== [] then []) 
    