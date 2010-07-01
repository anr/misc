-- ------------------------------------------------------------
-- Chapter 4
-- ------------------------------------------------------------

-- ex 1

halve :: [a] -> ([a], [a])
halve xs = ((take m xs), (drop m xs))
    where m = length xs `div` 2

-- ex 2

safetaila :: [a] -> [a]
safetaila xs = if null xs then [] else tail xs

safetailb :: [a] -> [a]
safetailb xs | null xs   = []
             | otherwise = tail xs

safetailc :: [a] -> [a]
safetailc [] = []
safetailc xs = tail xs

-- ex 3

or1 :: Bool -> Bool -> Bool
False `or1` False = False
True  `or1` False = True
False `or1` True  = True
True  `or1` True  = True

or2 :: Bool -> Bool -> Bool
False `or2` False = False
_     `or2` _     = True

or3 :: Bool -> Bool -> Bool
False `or3` b = b
_     `or3` _ = True

or4 :: Bool -> Bool -> Bool
b `or4` c | b == c    = b
          | otherwise = True

-- ex 4

and1 :: Bool -> Bool -> Bool
b `and1` c = if b == True then
                 if c == True then True else False
             else False

-- ex 5

and2 :: Bool -> Bool -> Bool
b `and2` c = if b == True then c else False

-- ex 6

mult :: Int -> Int -> Int -> Int
mult = \ x -> (\ y -> (\ z -> x * y * z))
