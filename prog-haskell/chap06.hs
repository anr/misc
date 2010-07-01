-- ------------------------------------------------------------
-- Chapter 6
-- ------------------------------------------------------------

-- ex 1

expo :: Int -> Int -> Int
expo m 0       = 1
expo m (n + 1) = m * (expo m n)

-- ex 3

and1 :: [Bool] -> Bool
and1 []     = True
and1 (x:xs) = x && and1 xs

concat1 :: [[a]] -> [a]
concat1 []     = []
concat1 (x:xs) = x ++ concat1 xs

replicate1 :: Int -> a -> [a]
replicate1 0 _       = []
replicate1 (n + 1) x = x : replicate1 n x

select1 :: [a] -> Int -> a
select1 (x:_) 0        = x
select1 (_:xs) (n + 1) = select1 xs n

elem1 :: Eq a => a -> [a] -> Bool
elem1 e []     = False
elem1 e (x:xs) = if e == x then True else elem1 e xs

-- ex 4

merge :: Ord a => [a] -> [a] -> [a]
merge xs []                     = xs
merge [] ys                     = ys
merge (x:xs) (y:ys) | x <= y    = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

-- ex 5

halve :: [a] -> ([a], [a])
halve xs = (take n xs, drop n xs)
    where n = length xs `div` 2

msort :: Ord a => [a] -> [a]
msort []  = []
msort [x] = [x]
msort xs  = merge (msort ys) (msort zs)
    where (ys, zs) = halve xs

-- ex 6

sum1 :: Num a => [a] -> a
sum1 [] = 0
sum1 (x:xs) = x + sum1 xs

take1 :: Int -> [a] -> [a]
take1 (n + 1) (x:xs) = x : take1 n xs
take1 _ _            = []

last1 :: [a] -> a
last1 [x]    = x
last1 (_:xs) = last1 xs
