--Ejercicio 1
--A) Defini los tipos de carrera de nuestra facultad
data Carrera = Matematica | Fisica | Astronomia | Computacion deriving (Eq)

--B)devuelve el nombre de la carrera completo en forma de string
titulo :: Carrera -> String 
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Astronomia = "Licenciatura en Astronomia"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"

--Main> titulo Computacion 
--"Licenciatura en Ciencias de la Computacion"

--C)Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Enum, Show)

--D)Programa usando pattern matching
cifradoAmericano :: NotaBasica -> Char 
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B' 

--Main> cifradoAmericano Do
--'C'

--EJERCICIO 2 
--A) Agregar los deriving en Carrera y notabasica
--Main> Matematica == Matematica
--True
--Main> Do <= Re
--True

--EJERCICIO 3 POLIFORMISMO AD HOC
--A) Definir usando polimorfismo ad hoc la funcion minimoElemento que calcula (de manera
--recursiva) cual es el menor valor de una lista de tipo [a]. Asegurarse que solo este
--definida para listas no vacıas. 

minimoElemento :: Ord a => [a] -> a 
minimoElemento [x] = x 
minimoElemento (x:xs) = x `min` minimoElemento xs

--B) Definir la funci´on minimoElemento’ de manera tal que el caso base de la recursi´on
--sea el de la lista vacıa. Para ello revisar la clase Bounded.

minimoElemento' :: (Bounded a, Ord a) => [a] -> a 
minimoElemento' [] = maxBound 
minimoElemento' (x:xs) = x `min` (minimoElemento' xs)

--C) Usar la funcion minimoElemento para determinar la nota mas grave de la melodıa:
--[Fa, La, Sol, Re, Fa]

masGrave :: [NotaBasica] -> NotaBasica
masGrave xs = minimoElemento xs 
--le agregue show y enum en notabasica para que ande bien.
--Main> masGrave [Do, Mi, Sol, Re]
--Do

--EJERCICIO 4
--A) Defini el tipo deportista

type Altura = Int 
type NumCamiseta = Int 

data Zona = Arco | Defensa | MedioCampo | Delantera deriving Show  
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil 

data Deportista = Ajedrecista 
                  | Ciclista Modalidad
                  | Velocista Altura 
                  | Tenista TipoReves ManoHabil Altura 
                  | Futbolista Zona NumCamiseta PiernaHabil Altura  deriving Show

--B) Cual es el tipo de constructor ciclista?
--Main> :t Ciclista
--Ciclista :: Modalidad -> Deportista

--C) Programa la funcion contar_velocistas :: [Deportista] -> Int que dada una
--lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs.
--Programar contar_velocistas sin usar igualdad, utilizando pattern matching.

contar_velocistas :: [Deportista] -> Int 
contar_velocistas [] = 0
contar_velocistas (x:xs) = 1 + contar_velocistas xs 

--Main> contar_velocistas [Ciclista Carretera, Futbolista Arco 3 Izquierda 2, Ciclista Pista]
--3

--D)Programa la funcion contar_futbolistas :: [Deportista] -> Zona -> Int que
--dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
--incluidos en xs que juegan en la zona z. No usar igualdad, solo pattern matching.

--FUNCION AUXILIAR PARA QUE SEAN LA MISMA ZONA
mismaZona :: Zona -> Deportista -> Bool 
mismaZona Arco (Futbolista Arco _ _ _) = True 
mismaZona Defensa (Futbolista Defensa _ _ _) = True 
mismaZona MedioCampo (Futbolista MedioCampo _ _ _) = True 
mismaZona Delantera (Futbolista Delantera _ _ _) = True 
mismaZona _ _ = False 

contar_futbolistas :: [Deportista] -> Zona -> Int 
contar_futbolistas [] _ = 0
contar_futbolistas ((Futbolista Arco _ _ _):xs) Arco = 1 + (contar_futbolistas xs Arco)
contar_futbolistas ((Futbolista Defensa _ _ _):xs) Defensa = 1 + (contar_futbolistas xs Defensa)
contar_futbolistas ((Futbolista MedioCampo _ _ _):xs) MedioCampo = 1 + (contar_futbolistas xs MedioCampo)
contar_futbolistas ((Futbolista Delantera _ _ _ ):xs) Delantera = 1 + (contar_futbolistas xs Delantera)
contar_futbolistas (_:xs) z = contar_futbolistas xs z 

--Main> contar_futbolistas [Futbolista Arco 1 Izquierda 2, Futbolista Defensa 2 Derecha 3, Futbolista Arco 2 Izquierda 2] Arco
--2
--Main> contar_futbolistas [] Arco
--0

--E) Pprgrama la func anterior usando filter
contar_futbolistas' :: [Deportista] -> Zona -> Int 
contar_futbolistas' xs zonaBuscada = length (filter (mismaZona zonaBuscada) xs) 

--Main> contar_futbolistas' [] Arco
--0
--Main> contar_futbolistas' [Futbolista Arco 1 Izquierda 2, Futbolista Defensa 2 Derecha 3, Futbolista Arco 2 Izquierda 2] Arco
--2

--EJERCICIO 5
--A) Implementa la funcion sonidoNatural como esta definida arriba.
sonidoNatural :: NotaBasica -> Int 
sonidoNatural Do = 0
sonidoNatural Re = 2 
sonidoNatural Mi = 4 
sonidoNatural Fa = 5 
sonidoNatural Sol = 7 
sonidoNatural La = 9 
sonidoNatural Si = 11 

--Main> sonidoNatural Re
--2

--B) Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural
--y Sostenido

data Alteracion = Bermol | Natural | Sostenido 

--C) Definir el tipo algebraico NotaMusical que debe tener un solo un constructor que llamaremos Nota 
--el cual toma dos parametros. El primer parametro es de tipo NotaBasica
--y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una
--nota alterada se puede usar como segundo par´ametro del constructor un Bemol o
--Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como
--segundo parametro.

data NotaMusical = Nota NotaBasica Alteracion 

--D)Definı la funci´on sonidoCromatico :: NotaMusical -> Int que devuelve el sonido
--de una nota, incrementando en uno su valor si tiene la alteracion Sostenido, decrementando en uno si tiene la alteraci´on Bemol y dejando su valor intacto si la alteraci´on
--es Natural

sonidoCromatico :: NotaMusical -> Int 
sonidoCromatico (Nota nb Sostenido) = sonidoNatural nb + 1
sonidoCromatico (Nota nb Bermol) = sonidoNatural nb - 1 
sonidoCromatico (Nota nb Natural) = sonidoNatural nb 

--E)Inclu´ı el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
--mismo valor de sonidoCromatico se consideren iguales.
--F) Inclu´ı el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
--que una nota es menor o igual a otra si y s´olo si el valor de sonidoCromatico para la
--primera es menor o igual al valor de sonidoCromatico para la segunda.

instance Eq NotaMusical where 
    nm1 == nm2 = sonidoCromatico nm1 == sonidoCromatico nm2 
instance Ord NotaMusical where 
    nm1 <= nm2 = sonidoCromatico nm1 <= sonidoCromatico nm2 

--EJERCICIO 6
--A) Definir la funci´on primerElemento que devuelve el primer elemento de una lista no
--vacıa, o Nothing si la lista es vacıa

primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing 
primerElemento (x:xs) = Just x 

--Main> primerElemento [2,3,4]
--Just 2
--Main> primerElemento []
--Nothing

--EJERCICIO 7.A
--1) atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que est´a
--en la primer posicion de una cola, por haber sido atendida. Si la cola esta vacıa,
--devuelve Nothing

data Cola = VaciaC | Encolada Deportista Cola deriving (Show)

atender :: Cola -> Maybe Cola 
atender VaciaC = Nothing
atender (Encolada d c) = Just c 

--Main> atender (VaciaC)
--Nothing
--Main> atender (Encolada (Ciclista Pista)(Encolada (Ciclista Monte) VaciaC))
--Just (Encolada (Ciclista Monte) VaciaC)

--2) encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola
--de deportistas, en la ultima posicion.

encolar :: Deportista -> Cola -> Cola 
encolar d VaciaC = Encolada d VaciaC
encolar d (Encolada uno c) = Encolada uno (encolar d c)

--Main> encolar (Ciclista Pista) VaciaC
--Encolada (Ciclista Pista) VaciaC
--Main> encolar (Ciclista Pista) (Encolada (Ciclista Monte) VaciaC)
--Encolada (Ciclista Monte) (Encolada (Ciclista Pista) VaciaC)

--3) busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera
--futbolista dentro de la cola que juega en la zona que se corresponde con el segundo
--parametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.

busca :: Cola -> Zona -> Maybe Deportista 
busca VaciaC _ = Nothing 
busca (Encolada d c) zon | mismaZona zon d = Just d
                       | otherwise = busca c zon 

--EJERCICIO 7.B
--A que otro tipo se parece cola ? se parece a las listas

--EJERCICIO 8.A 
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving (Show)
type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String  
-- ¿Como se debe instanciar el tipo ListaAsoc para representar la informaci´on almacenada
--en una guıa telefonica?
--Se debe instanciar del tipo Lista Asoc NombreyApellido Tel
type NombreyApellido = String
type Tel = Int
type GuiaTel = ListaAsoc NombreyApellido Tel

--8.B
--1) la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una lista.

la_long :: ListaAsoc a b -> Int 
la_long Vacia = 0 
la_long (Nodo a b list) = 1 + la_long (list) 

--Main> la_long (Nodo 1 "uno" (Nodo 2 "dos" (Nodo 3 "tres" Vacia)))
--3
--Main> la_long Vacia
--0

--2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, 
--que devuelve la concatenacion de dos listas de asociaciones.

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat Vacia l = l 
la_concat (Nodo a b r) c = la_concat r (Nodo a b c)

--Nodo 2 "dos" (Nodo 1 "uno" (Nodo 3 "Tres" Vacia))
--Main> la_concat Vacia Vacia
--Vacia

--3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que
--agrega un nodo a la lista de asociaciones si la clave no esta en la lista, o actualiza
--el valor si la clave ya se encontraba.

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b 
la_agregar c z x = Nodo z x c  

--4) la_pares :: ListaAsoc a b -> [(a, b)] 
--que transforma una lista de asociaciones en una lista de pares clave-dato.

la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo a b (xs)) = (a,b) : (la_pares xs)

--Main> la_pares (Nodo 1 "uno" (Nodo 2 "dos" Vacia))
--[(1,"uno"),(2,"dos")]
--Main> la_pares Vacia
--[] 

--5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista
--y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
--Nothing

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia n = Nothing
la_busca (Nodo a b (xs)) n | a == n = Just b 
                           | otherwise = la_busca xs n 

--Main> la_busca (Nodo 1 "uno" (Nodo 2 "dos" Vacia)) 2
--Just "dos"
--Main> la_busca Vacia 2
--Nothing

--6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada
--una clave a elimina la entrada en la lista.

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b 
la_borrar _ Vacia = Vacia 
la_borrar n (Nodo a b (xs)) | n == a = xs 
                            | otherwise = (la_borrar n xs)

--Main> la_borrar 1 (Nodo 1 "uno" (Nodo 2 "dos" (Nodo 3 "tres" Vacia))) 
--Nodo 2 "dos" (Nodo 3 "tres" Vacia)
--Main> la_borrar 2 Vacia
--Vacia