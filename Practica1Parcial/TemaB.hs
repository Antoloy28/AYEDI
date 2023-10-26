--a)defini el tipo palo y luego program la func q dado dos valores p1 y p2 devuelve trur
--sii p1 y p2 son del mismo palo
data Palo = Espada | Basto | Oro | Copa deriving (Show)

mismo_palo :: Palo -> Palo -> Bool 
mismo_palo Espada Espada = True 
mismo_palo Basto Basto = True 
mismo_palo Oro Oro = True 
mismo_palo Copa Copa = True 
mismo_palo _ _ = False 

--defini el tipo fugura q consta de los constr uno dos....
--programa la func q dada una func f devuelve su valor dada en la tabla
--ahora defini el tipo carta q tiene un constr naipe q toma dos parametros figura y palo 
--prg la func q dada dos cartas c1 y c2 si tienen el mismo palo devuelve la suima d valores
--de ambas cartas usando el constr just y nothing si no son el mismo palo
data Figura = Uno | Dos | Tres | Cuatro | Cinco | Seis | Siete | Sota | Caballo | Rey deriving (Show)
valor_figura :: Figura -> Int 
valor_figura Uno = 1 
valor_figura Dos = 2 
valor_figura Tres = 3 
valor_figura Cuatro = 4 
valor_figura Cinco = 5
valor_figura Seis = 6 
valor_figura Siete = 7 
valor_figura Sota = 8 
valor_figura Caballo = 9 
valor_figura Rey = 10 


data Carta = Naipe Figura Palo deriving (Show)


suma_cartas :: Carta -> Carta -> Maybe Int 
suma_cartas (Naipe f1 c1) (Naipe f2 c2) |mismo_palo c1  c2 = Just (valor_figura f1 + valor_figura f2)
                                        | otherwise = Nothing
--Main> suma_cartas (Naipe Uno Basto) (Naipe Dos Oro)
--Nothing
--Main> suma_cartas (Naipe Uno Basto) (Naipe Dos Basto)
--Just 3

--2) prog la func q dada una carta c y una lista de cartas cs devuelve las figuras de las cartas cs
--q son del mismo palo q c y q al sumarse el valpr c no supera 15 
compatibles :: Carta -> [Carta] -> [Figura]
compatibles _ [] = []
compatibles (Naipe f1 p1)((Naipe f2 p2):xs) | mismo_palo p1 p2 && valor_figura f1 + valor_figura f2 <= 15 = f2: compatibles (Naipe f1 p1) xs
                                            | otherwise = compatibles (Naipe f1 p1) xs

--Main> compatibles (Naipe Seis Oro) [Naipe Rey Oro, Naipe Tres Basto, Naipe Sota Oro]
--[Sota]
--Main> compatibles (Naipe Seis Oro) []
--[]

--3) defini el tipo duracion como sinonimo de int y nombre como sinonimo de string
--luego el tipo cancion q tiene un constr tema con dos parametros nombre y duracion
--defini el estado con los constr escuchando y noescuchando
--defini el tipo Playlist q tiene los constr enlaList q toma los parametros cancion estado y playlist y el otro const vacia
--programa la func q dada una lista de reproduccion p1 devuelve la suma de las duraciones
-- de los temas que tienen escuchando
type Duracion = Int 
type Nombre = String 
data Cancion = Tema Nombre Duracion 
data Estado = Escuchando | NoEscuchando 
data PlayList = EnlaLista Cancion Estado PlayList | Vacia 

tiempo_reproduccion :: PlayList -> Int 
tiempo_reproduccion Vacia = 0
tiempo_reproduccion (EnlaLista (Tema n d) Escuchando restlist) = d + tiempo_reproduccion restlist
tiempo_reproduccion (EnlaLista (Tema n d) NoEscuchando restlist) = tiempo_reproduccion restlist
--Main> tiempo_reproduccion (EnlaLista (Tema "Pepito" 3) Escuchando (EnlaLista (Tema "bebe" 2) Escuchando (EnlaLista (Tema "amorrrr" 5) NoEscuchando Vacia)))
--5
--Main> tiempo_reproduccion Vacia
--0