--a) defini el tipo numeracion q consta cn los contr...
--programa la func que dado dos valores n1 y n2 de tipo numeracion devuelve true sii
--son iguales
data Numeracion = Cero | Uno | Dos | Tres | Cuatro deriving (Show)

misma_numeracion :: Numeracion -> Numeracion -> Bool 
misma_numeracion Cero Cero = True 
misma_numeracion Uno Uno = True 
misma_numeracion Dos Dos = True 
misma_numeracion Tres Tres = True 
misma_numeracion Cuatro Cuatro = True 
misma_numeracion _ _ = False 

--b)deifni el tipo domino que consta d un unico const Ficha q toma dos parametros ambos
--del tipo numeracion . prgrama la func q dada dos fichas f1 y f2 que si en numero de abajo f1
--coincide con el numero de arriba f2 devuelve el num de abajo de f2 usando el constr just
--si el numero d abajo de f1 no coincide con el num de arriba f2 se considera q no encaja y devuelve nothing
data Domino = Ficha Numeracion Numeracion deriving (Show)

encajar :: Domino -> Domino -> Maybe Numeracion 
encajar (Ficha f1 n1) (Ficha f2 n2) | misma_numeracion n1 f2 = Just n2 
                                    | otherwise = Nothing 
--Main> encajar (Ficha Cero Tres) (Ficha Tres Uno)
--Just Uno
--Main> encajar (Ficha Uno Cero) (Ficha Dos Tres)
--Nothing

--2) prog la func q dada una lista ds de dominos y una numeracion n devuelve la numeracion
-- de abajo de las fichas en ds que tienen la numeracion de arriba a n

compatibles :: [Domino] -> Numeracion -> [Numeracion]
compatibles [] _ = []
compatibles ((Ficha f1 n1):xs) num | misma_numeracion f1 num = n1 : compatibles xs num
                                   | otherwise = compatibles xs num  

--Main> compatibles [Ficha Cero Uno, Ficha Tres Dos, Ficha Cero Cuatro] Cero
--[Uno,Cuatro]
--Main> compatibles [] Cero
--[]

--3)definir el tipo evento como sinimo de string. definir el tipo categoria que tiene los
--constr cumple, reunion, otro.
--definir a partir de los tipos anteriores el tipo recursivo calendario cuyos constr son
-- agendar q tiene parametro evento categoria y calendario y el otro constr sineventos
--prog la func q dado un calendariuo ca devuelve una lista de eventos es con los eventos
-- de ca q tienen la categoria reunion 
type Evento = String
data Categoria = Cumple | Reunion | Otro deriving (Show)
data Calendario = Agendar Evento Categoria Calendario | SinEventos 

--func auxiliar
mismaCategoria :: Categoria -> Categoria -> Bool 
mismaCategoria Cumple Cumple = True 
mismaCategoria Reunion Reunion = True 
mismaCategoria Otro Otro = True 
mismaCategoria _ _ = False 

listar_reuniones :: Calendario -> [Evento]
listar_reuniones SinEventos = []
listar_reuniones (Agendar evento categoria ca) | mismaCategoria categoria Reunion = evento : listar_reuniones ca 
                                               | otherwise = listar_reuniones ca 

--Main> listar_reuniones (Agendar "Fiestita" Cumple (Agendar "Laburo" Reunion (Agendar "Gym" Otro SinEventos)))
--["Laburo"]
--Main> listar_reuniones SinEventos
--[]