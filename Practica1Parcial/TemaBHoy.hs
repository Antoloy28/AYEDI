--a) Si tengo una función con la siguiente declaración
--f :: (Eq a, Ord a) => a -> a -> a
--f x y | x<y = x
-- | otherwise = y
--puedo decir que:
--1) a sólo puede tomar valores que representan números (Int, Float, etc.)
--2) x sólo puede tomar valores numéricos.
--3) a es una variable de tipo. RTA CORRECTA
--4) x es una variable de tipo.
--5) Ninguna de las anteriores.

--b) Si tengo la función definida en el punto a) y el tipo enumerado:
--data TipoEnum = Val1 | Val 2 | Val3
--puedo decir que:
--1) TipoEnum no es un tipo enumerado.
--2) f Val1 Val2 retorna Val1.
--3) f Val1 Val2 retorna Val2.
--4) No se puede instanciar a con el tipo TipoEnum. RTA CORRECTA
--5) Ninguna de las anteriores.

--c) Si tengo la función definida en el punto a) y el tipo enumerado:
--data TipoEnum = Val1 | Val 2 | Val3 deriving (Eq,Ord,Show)
--puedo decir que:
--1) TipoEnum no es un tipo enumerado.
--2) f Val1 Val2 retorna Val1.
--3) f Val1 Val2 retorna Val2.
--4) No se puede instanciar a con el tipo TipoEnum. RTA CORRECTA
--5) Ninguna de las anteriores.

--d) Teniendo en cuenta la definición de la función del punto a) se puede decir de la
--invocación f (5::Int) que:
--1) No se puede invocar f en 5 puesto que falta un parámetro.
--2) f 5 es una función de tipo a -> a.O ESTA ?????
--3) f 5 es una función de tipo Int -> a.
--4) f 5 es una función de tipo Int -> Int. RTA CORRECTA
--5) Ninguna de las anteriores

--2)a)
data Categoria = Literatura | Infantiles | Autoayuda | Comics deriving (Show)
data Editorial = Altea | MinoTauro | Panini deriving (Show)
type Titulo = String 
type Precio = Int 
data Marca = Monoblock | Papikra deriving (Show)
type AnioAgenda = Int 
data ArticulosLibreria = Libro Categoria Editorial Titulo Precio 
                         | Agendas Marca AnioAgenda Precio 
                         | Cuaderno Marca Precio deriving (Show)

--b)que dada una lista de ArticulosLibreria ls y un precio p, devuelve la lista de libros
--con precio menor o igual a p.

librosBaratos :: [ArticulosLibreria] -> Precio -> [ArticulosLibreria]
librosBaratos [] _ = []
librosBaratos ((Libro ca ed ti p):xs) precio | p <= precio = (Libro ca ed ti p) : librosBaratos xs precio 
                                          | otherwise = librosBaratos xs precio 
librosBaratos (_:xs) precio = librosBaratos xs precio

listaLibros = [Libro Literatura Altea "Hola" 20, Libro Literatura Altea "Hola" 25,
            Libro Literatura Altea "CHau" 40, Libro Literatura Altea "Chau" 200]

--Main> librosBaratos listaLibros 30
--[Libro Literatura Altea "Hola" 20,Libro Literatura Altea "Hola" 25]
--Main> librosBaratos [] 20
--[]

--c) Definir igualdad para el tipo de ArticulosLibreria : de tal manera que, dos artículos
--de tipo Libro son iguales sólo si tienen la misma Editorial y el mismo Precio, dos
--Agendas son iguales sólo si tienen el mismo AnioAgenda y el mismo Precio, mientras
--que dos cuadernos son iguales si tienen el mismo Precio. Como es de suponer los
--Libros, Agendas y Cuadernos son distintos entre sí.

mismaEditorial :: Editorial -> Editorial -> Bool 
mismaEditorial  Altea Altea = True 
mismaEditorial MinoTauro MinoTauro = True 
mismaEditorial Panini Panini = True 
mismaEditorial _ _ = False 

instance Eq ArticulosLibreria where 
    (Libro c1 ed1 t1 pr1) == (Libro c2 ed2 t2 pr2) = (mismaEditorial ed1 ed2) && (pr1 == pr2)
    (Agendas m1 anio1 pr1) == (Agendas m2 anio2 pr2) = (anio1 == anio2) && (pr1 == pr2)
    (Cuaderno m1 pr1) == (Cuaderno m2 pr2) = (pr1 == pr2)
    _ == _ = False 

--3) 
type NyA = String
data Nivel = Uno | Dos | Tres deriving Show
type PrimerParcial = Int 
type SegundoParcial = Int 
type Final = Int 
data NotasdeIngles = EvoluciondelEstudiante NyA Nivel PrimerParcial SegundoParcial Final NotasdeIngles | NohayEstudiantes deriving Show

--b) Programar la función pasaDeNivel, que toma como primer parámetro notas del tipo
--NotasDeIngles, y como segundo parámetro el nombre de un estudiante (de la lista) de
--tipo String y retorna un valor de tipo Bool, indicando si el estudiante con ese nombre
--pasa de nivel o no.

--pasaDeNivel :: NotasDeIngles -> NyA -> Bool 
--pasaDeNivel NohayEstudiantes _ = False 
--pasaDeNivel (EvoluciondelEstudiante nombre primParcial segParcial final) nya | nombre == nya (Uno (primParcial + segParcial + final) >= 15) || (Dos(primParcial + segParcial + final) >= 24) || (Tres (primParcial + segParcial + final) >= 30)
 --                                                                            | otherwise = pasaDeNivel NohayEstudiantes nya 


pasaDeNivel :: NotasdeIngles -> NyA -> Bool
pasaDeNivel NohayEstudiantes _ = False  
pasaDeNivel (EvoluciondelEstudiante nombre Uno primerParcial segundoParcial final m) estudianteBuscado
    | nombre == estudianteBuscado && (primerParcial + segundoParcial + final) >= 15 = True

pasaDeNivel (EvoluciondelEstudiante nombre Dos primerParcial segundoParcial final m) estudianteBuscado
    | nombre == estudianteBuscado && (primerParcial + segundoParcial + final) >= 24 = True

pasaDeNivel (EvoluciondelEstudiante nombre Tres primerParcial segundoParcial final m ) estudianteBuscado
    | nombre == estudianteBuscado && (primerParcial + segundoParcial + final) >= 30 = True

pasaDeNivel _ estudianteBuscado = pasaDeNivel NohayEstudiantes estudianteBuscado  -- Si no es el estudiante buscado, seguimos buscando en la lista.

estudiante1 = EvoluciondelEstudiante "Anto" Uno 7 7 7
estudiante2 = EvoluciondelEstudiante "Juancito" Uno 2 5 7 
estudiante3 = EvoluciondelEstudiante "Pepito" Dos 8 8 8 