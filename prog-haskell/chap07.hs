-- ------------------------------------------------------------
-- Chapter 7
-- ------------------------------------------------------------

-- ex 1

mf :: (a -> b) -> (a -> Bool) -> ([a] -> [b])
mf f p = map f . filter p

-- ex 2

all1 :: (a -> Bool) -> ([a] -> Bool)
all1 p = and . map p

any1 :: (a -> Bool) -> ([a] -> Bool)
any1 p = or . map p

takeWhile1 :: (a -> Bool) -> [a] -> [a]
takeWhile1 _ []                 = []
takeWhile1 p (x:xs) | p x       = x : takeWhile1 p xs
                    | otherwise = []

dropWhile1 :: (a -> Bool) -> [a] -> [a]
dropWhile1 _ []                 = []
dropWhile1 p (x:xs) | p x       = dropWhile1 p xs
                    | otherwise = x : xs

-- 3

mapf :: (a -> b) -> ([a] -> [b])
mapf f = foldr (\ x xs -> f x : xs) []

filterp :: (a -> Bool) -> ([a] -> [a])
filterp p = foldr (\ x xs -> if p x then x : xs else xs) []

-- 4

dec2int :: [Int] -> Int
dec2int xs = foldl (\ a d -> 10 * a + d) 0 xs

-- 5

{- 
   As defined, compose takes a list of functions of type (a -> a)
   and returns a function of type (a -> a).

   In the example given, the list has functions of type [a] -> a and
   [a] -> [a].
-}

-- 6

curry1 :: ((a, b) -> c) -> a -> b -> c
curry1 f x y = f (x, y)

uncurry1 :: (a -> b -> c) -> (a, b) -> c
uncurry1 f p = f (fst p) (snd p)

-- ex 7

unfold p h t x | p x       = []
               | otherwise = h x : unfold p h t (t x)

chop8 = unfold null (take 8) (drop 8)

mapf1 f = unfold null (f . head) (tail)

iteratef f = unfold (\ _ -> False) (id) (f)

-- ex 8

calcParity :: [Bit] -> Bit
calcParity bits = sum bits `mod` 2

addParity :: [Bit] -> [Bit]
addParity bits = bits ++ [calcParity bits]

remParity :: [Bit] -> [Bit]
remParity bits | calcParity (init bits) == last bits = init bits
               | otherwise                           = error "Parity error!"

encode :: String -> [Bit]
encode = concat . map (addParity . make8 . int2bin . ord)

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int . remParity) . chop9

-- ex 9

channel :: [Bit] -> [Bit]
channel bits = tail bits
