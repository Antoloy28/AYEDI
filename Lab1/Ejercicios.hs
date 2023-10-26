--EJERCICIO 1.A -- Verifica si un entero es igual a 0
esCero :: Int -> Bool
esCero a = (a==0)
--EJEMPLO 
--Main> esCero 1
--False
--Main> esCero 0
--True

--EJERCICIO 1.B --Verifica si un entero es estrictamente mayor a 0
esPositivo :: Int -> Bool 
esPositivo x | x > 0 = True
             | x <= 0 = False 
--EJEMPLO
--Main> esPositivo 2
--True
--Main> esPositivo 0
--False  

--EJERCICIO 1.C -- Verifica si un carcater en vocal en minuscula 
esVocal :: Char -> Bool 
esVocal n | n == 'a' = True 
          | n == 'e' = True
          | n == 'i' = True 
          | n == 'o' = True 
          | n == 'u' = True 
          | otherwise = False 
--EJEMPLO
--Main> esVocal 'a'
--True
--Main> esVocal 'A'
--False

--EJERCICIO 1.D --Que devuelve el valor absoluto de un valor ingresado
valorAbsoluto :: Int -> Int 
valorAbsoluto x | x >= 0 = x 
                | otherwise = -x 
--EJEMPLO
--Main> valorAbsoluto 0
--0
--Main> valorAbsoluto (-3)
--3

--EJERCICIO 2.A --Verifica que todos los elementos de una lista sean true 
paraTodo :: [Bool] -> Bool 
paraTodo [] = True 
paraTodo (x:xs) = x && (paraTodo xs) 
--EJEMPLO
--Main> paraTodo [True, False]
--False
--Main> paraTodo [True, True]
--True

--EJERCICIO 2.B --Calcula la suma de todos los elemetnos de una lista de enteros 
sumatoria :: [Int] -> Int 
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs 
--EJEMPLO
--Main> sumatoria []
--0
--Main> sumatoria [2,3]
--5

--EJERCICIO 2.C --Calcula el producto de toda la lista de enteros 
productoria :: [Int] -> Int 
productoria [] = 1
productoria (x:xs) = x * productoria xs 
--EJEMPLO
--Main> productoria []
--1
--Main> productoria [2,3]
--6

--EJERCICIO 2.D --Que toma un numero n y calcula n!
factorial :: Int -> Int 
factorial 0 = 1
factorial n = n * (factorial (n-1))
--EJEMPLO
--Main> factorial 0
--1
--Main> factorial 3
--6

--EJERCICIO 2.E --que toma una lista de enteros y calcula el promedio
promedio :: [Int] -> Int 
promedio [] = 0
promedio (xs) = div (sumatoria (xs)) (length xs) 
--EJEMPLO 
--Main> promedio []
--0
--Main> promedio [7,7]
--7

--EJERCICIO 3 --Verifica si un numero se encuentra en la lista
pertenece :: Int -> [Int] -> Bool 
pertenece n [] = False 
pertenece n(x:xs) = (n==x) || pertenece n xs 
--EJEMPLO 
--Main> pertenece 6 [2,6,6]
--True
--Main> pertenece 6 [2,3,4]
--False

--EJERCICIO 4-A -- dada una lista xs de tipo [a] y un predicado t :: a -> Bool, determina si todos los elementos de xs satisfacen el predicado t
paratodo' :: [a] -> (a -> Bool) -> Bool 
paratodo' [] t = True
paratodo' (x:xs) f = f x && paratodo' xs f 
--EJEMPLO
--Main> paratodo' [0,0,0] esCero
--True
--Main> paratodo' [0,1,0] esCero
--False

--EJERCICIO 4.B -- dada una lista xs de tipo [a] y un predicado t :: a -> Bool, determina si algun elemento de xs satisface el predicado t
existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False 
existe' (x:xs) t = (t x) || (existe' xs t)
--EJEMPLO
--Main> existe' [0,1] esCero
--True
--Main> existe' [1,1] esCero
--False

--EJERCICIO 4.C -- dada una lista xs de tipo [a] y una funcion t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la suma de los valores que resultan de la aplicaci ́on de t a los elementos de xs.
sumatoria' :: [a] -> (a->Int) -> Int 
sumatoria' [] t = 0
sumatoria' (x:xs) t = (t x) + (sumatoria' xs t) 

--EJERCICIO 4.D --dada una lista de xs de tipo [a] y una funcion t :: a -> Int, calcula el producto de los valores que resultan de la aplicacion de t a los elementos de xs.
productoria' :: [a] -> (a->Int) -> Int 
productoria' [] t = 1
productoria' (x:xs) t = (t x) * (productoria' xs t)

--EJERCICIO 5 -- Definı nuevamente la funcion paratodo, pero esta vez usando la funcion paratodo’ (sin  recursion ni analisis por casos!).
paratodo'' :: [Bool] -> Bool 
paratodo'' a = (paratodo' a id)

--EJERCICIO 6.A -- verifica que todos los num de una lista sean pares
todosPares :: [Int] -> Bool 
todosPares xs = paratodo' xs even 
--EJEMPLO *Main> todosPares [2,3,4,6]
--False
--Main> todosPares [2,2,4,6]
--True

--EJERCICIO 6.B -- verifica si existe algun num dentro del segundo parametro que sea multiplo del primer parametro
--FUNC AUX
ayu :: Int -> Int -> Bool
ayu n x = (mod x n) == 0 

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (ayu n) 
--EJEMPLO
--Main> hayMultiplo 2 [2,4,6]
--True
--Main> hayMultiplo 12 [2,4,6]
--False

--EJERCICIO 6.C-- dado un num no negativo n, calcula la suma de los primeros n cuadrados 
sumaCuadrados :: Int -> Int 
sumaCuadrados n = sumatoria' [0..n] (^2)
--EJEMPLO
--Main> sumaCuadrados 0
--0
--Main> sumaCuadrados 1
--1

--EJERCICIO 6.D --dado un entero n y una lista ls, deuelve true si y solo si existe algun elem en ls q divida a na
existeDivisor :: Int -> [Int] -> Bool 
existeDivisor n ls = any (\x -> n `mod` x == 0) ls
--EJEMPLO
--Main> existeDivisor 5 [1,2,3]
--True
--Main> existeDivisor 5 [4,2,3]
--False

--EJERCICIO 6.E --q dado un entero n devuelve true si y solo si n es primo
esPrimo :: Int -> Bool 
esPrimo n | n <= 1 = False 
          | otherwise = not $ existeDivisor n [2..(n-1)]
--EJEMPLO
--Main> esPrimo 7
--True
--Main> esPrimo 0
--False

--EJERCICIO 6.F -- modificar el ejercicio de factorial sin usar recursion
factorial' :: Int -> Int
factorial' n = productoria' [1..n] id 
--EJEMPLO
--Main> factorial' 3
--6

--EJERCICIO 6.G --calcula el prodcuto de todos los num primos de una lista
multiplicaPrimos :: [Int] -> Int 
multiplicaPrimos xs = product $ filter esPrimo xs 
--EJEMPLO
--Main> multiplicaPrimos [4,3,6]
--3
--Main> multiplicaPrimos [2,4,3,6]
--6

--EJERCICIO G.H --dado un entero n, devuelve true si y solo si esta en la suc fib
fib :: Int -> Int 
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

esFib :: Int -> Bool 
esFib n = any (==n) (map fib [0..])

--EJERCICIO 6.I --dada una lista xs de enteros, devuelva si todos los elemetnos de la lista pertenecen o no a la suc fib
todosFib :: [Int] -> Bool 
todosFib xs = all esFib xs 

--EJERCICIO 7
--MAP es una funcon que permite transformar los elementos de una lista y devuelve una nueva lista con los elementos transforrmados.
--FILTER muestra una version filtrada del rango de origen compuesta unicamente por las filas o columnas que cumplen las condiciones especificadas.
--la expresion map succ [1,-4,6,2,-8] donde n = n + 1 equivale a una expresion que lo que hace es sumarle 1 a cada elemento de la lista xs quedando en otra lista [2,-3,7,3,-7].
--La expresion filter esPositivo [1,-4,6,2,-8] equivale a una expresion que lo que hace es filtrar la lista xs de modo tal que retorne una lista con solo valores positivos quedando [1,6,2].

--EJERCICIO 8.A --dada una lista xs devuelve la lista que resulta de duplicar cada valor de xs
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x*2):(duplica xs)
--EJEMPLO
--Main> duplica []
--[]
--Main> duplica [2,4,5]
--[4,8,10]

--EJERCICIO 8.B ..lo mismo q arriba pero usando la func map
duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs 
--EJEMPLO
--Main> duplica' [2,3,4]
--[4,6,8]

--EJERCICIO 9.A --dada una lista de numeros xs, calcula una losta de tiene como eleme aquellos num de xs q son primos
soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs) | even x = x : (soloPares xs)
                 | otherwise = soloPares xs 
--EJMEPLO
--Main> soloPares [2,4,5]
--[2,4]
--Main> soloPares [5]
--[]

--EJERCICIO 9.B --lo mismo pero usando filter
soloPares' :: [Int] -> [Int]
soloPares' xs = filter even xs 
--la funcion filter elimina todos los elementos de la lista que no son pares.
--EJEMPLO
--Main> soloPares' [2,3,4]
--[2,4]

--EJERCICIO 10.A --toma un valor y una lista y calcula el tramo iicial mas largo de la lista cuyos elem son iguales a ese valor
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | (n==x) = x : (primIgualesA n xs)
                      | otherwise = primIgualesA n []
--EJEMPLO
--Main> primIgualesA 3 [3,3,4,1]
--[3,3]

--EJERCICIO 10.B --lo mismo pero usando takewhile
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs 
--la funcion takewhile solo devulve los elementos que son iguales, mayores o menores (iguales) d una lista

--EJERCICIO 11.A --TOMA UNA LISTA y devuelve el may tramo inicial de la lista cuyos elem son todos iguales entre si
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x : xs)
  | xs == [] = []
  | x == head xs = x : primIguales xs 
  | x /= head xs = x : []
--EJEMPLO
--Main> primIguales [3,3,4,1]
--[3,3]

--EJERCICIO 11.B
primIguales':: Eq a => [a] -> [a]
primIguales' xs = primIgualesA'(head xs) xs


