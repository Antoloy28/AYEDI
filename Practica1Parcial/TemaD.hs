--a) definir el tipo color con los constr .. prorg la funcion q dados dos colores c1 y c2
-- del tipo color devuelve true sii son del mismo color
data Color = Rojo | Negro | Azul deriving (Show)

mismo_color :: Color -> Color -> Bool 
mismo_color Rojo Rojo = True 
mismo_color Negro Negro = True 
mismo_color Azul Azul = True 
mismo_color _ _ = False 

--b)difini el tipo Tipo q tiene los constr ...
--defini el tipo vehiculo q consta de un unico contr Cons q toma dos parametros Tipo y colo
--prgrama la func que dado un vehiculo v y un color c devuelve nothing si v no es auto
--si v es auto devuelve un auto de color c usando el const just 
data Tipo = Auto | Moto | Camion deriving (Show)
data Vehiculo = Cons Tipo Color deriving (Show)

pintar_auto :: Vehiculo -> Color -> Maybe Vehiculo 
pintar_auto (Cons Auto c ) co = Just (Cons Auto co)
pintar_auto _ _ = Nothing
--Main> pintar_auto (Cons Auto Rojo) Negro
--Just (Cons Auto Negro)
--Main> pintar_auto (Cons Moto Rojo) Negro
--Nothing

--2) prog la funcion q dado un color c y una lista cs devuelve los tipos de vehiculos d
--de cs q tienen color c 
solo_de_color :: Color -> [Vehiculo] -> [Tipo]
solo_de_color _ [] = []
solo_de_color c ((Cons t co):xs) | mismo_color c co = t : solo_de_color c xs 
                                 | otherwise = solo_de_color c xs 
--Main> solo_de_color Rojo [Cons Auto Rojo, Cons Moto Negro, Cons Camion Rojo]
--[Auto,Camion]
--Main> solo_de_color Negro []
--[]

--3) definir el tipo precio como sinonimo de int y nombre como string
--defini el tipo producto que tiene un unuco contr Item q tiene parametros nombre y precio
--defini el el compra que tiene los const nada y Agregarprod q tiene 3 param producto precio y cmpra
--prog la func q dada una compra comp devuleve la suma de los precios de los produc compraods
type Precio = Int 
type Nombre = String 
data Producto = Item Nombre Precio deriving (Show)
data Compra = Nada | AgregarProd Producto Precio Compra deriving (Show)


costo :: Compra -> Precio 
costo Nada = 0 
costo (AgregarProd (Item n p) pr comp) = p + costo comp 
--Main> costo (AgregarProd (Item "Leche" 400) 100 (AgregarProd (Item "Azucar" 300) 200 Nada))
--700
--Main> costo (Nada)
--0