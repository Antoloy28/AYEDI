--a) defini el tipo forma 
data Forma = Piedra | Papel | Tijera deriving (Show)
--progrma la funcion que dada una f1 y f1 de tipo forma devuelve true sii f1 es de la
--misma forma de f2 . reglas :piedra le gana a tijera, tijera le gana a papel, papel le gana a piedra
le_gana :: Forma -> Forma -> Bool
le_gana Piedra Tijera = True 
le_gana Tijera Papel = True 
le_gana Papel Piedra = True 
le_gana _ _ = False 
--Main> le_gana Piedra Tijera
--True
--Main> le_gana Piedra Papel
--False

--b) defini el tipo nombre como sinonimo de string . luego defini jugador que consta 
-- de un unico contrstuctor mano que toma dos parametros el prim de tipo Nombre y el
--segundo de tipo Forma y progtama la func q dado j1 y j2 debe devolves el nombre del jugador
--ganador (j1 o j2) segun corresponda usando just y nothing en caso de q no haya ganador  
type Nombre = String 
data Jugador = Mano Nombre Forma 

ganador :: Jugador -> Jugador -> Maybe Nombre 
ganador (Mano n1 f1) (Mano n2 f2) | le_gana f1 f2 = Just n1 
                                  | le_gana f2 f1 = Just n2 
                                  | otherwise = Nothing 
--Main> ganador (Mano "Anto" Papel)(Mano "More" Tijera)
--Just "More"
--Main> ganador (Mano "Anto" Papel)(Mano "More" Papel)
--Nothing

--2) progrma la funcion q dada una forma f y una lista de jugadores js devuelve los 
--nombres de los jugadores de js que usaron la forma f 
--func auxiliar para ver si son de la misma forma (ademas tmb es por en el enunciado pide no usar eq)
mismaForma :: Forma -> Forma -> Bool
mismaForma Piedra Piedra = True 
mismaForma Papel Papel = True 
mismaForma Tijera Tijera = True 
mismaForma _ _ = False 

quien_jugo :: Forma -> [Jugador] -> [Nombre]
quien_jugo _ [] = []
quien_jugo forma ((Mano n forma'):xs) |mismaForma forma forma' = n : quien_jugo forma xs 
                              | otherwise = quien_jugo forma xs 
--Main> quien_jugo Piedra [Mano "Anto" Piedra, Mano "More" Piedra, Mano "Maribel" Tijera]
--["Anto","More"]
--Main> quien_jugo Piedra []
--[]

--3) defini el tipo notamusical con lso constr do re mi fa sol la si 
--luego defini el tipo figura que consta de los constr negra y corchea 
--lueg el tipo melodia q los constr son entonar que toma e parametros Notamusical Figura
-- y melodia y el otro construct vacia
data Notamusical = Do | Re | Mi | Fa | Sol | La | Si deriving (Show)
data Figura = Negra | Corchea 
data Melodia = Entonar Notamusical Figura Melodia | Vacia 

contar_tiempos :: Melodia -> Int 
contar_tiempos Vacia = 0
contar_tiempos (Entonar nm Negra m) = 2 + contar_tiempos m 
contar_tiempos (Entonar nm Corchea m) = 1 + contar_tiempos m 
--Main> contar_tiempos Vacia 
--0
--Main> contar_tiempos (Entonar Do Negra (Entonar Re Corchea (Entonar Mi Negra Vacia)))
--5

--4) 
data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)

arbol_sum :: Arbol Int -> Arbol Int -> Arbol Int 
arbol_sum arbol Hoja = arbol 
arbol_sum Hoja arbol = arbol 
arbol_sum (Rama arbol1 n arbol2) (Rama arbol3 m arbol4) = Rama (arbol_sum arbol1 arbol3)(n+m)(arbol_sum arbol2 arbol4)
