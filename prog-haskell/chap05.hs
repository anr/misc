-- ------------------------------------------------------------
-- Chapter 5
-- ------------------------------------------------------------

-- ex 1

sumsqrs :: Int
sumsqrs = sum [x^2 | x <- [1..100]]

-- ex 2

replicate1 :: Int -> a -> [a]
replicate1 n x = [x | _ <- [1..n]]

-- ex 3

pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- ex 4

factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (init (factors x)) == x]

-- ex 5

form1 :: [(Int, Int)]
form1 = [(x, y) | x <- [1, 2, 3], y <- [4, 5, 6]]

form2 :: [(Int, Int)]
form2 = concat [[(x, y) | y <- [4, 5, 6]] | x <- [1, 2, 3]]

-- ex 6

find :: Eq a => a -> [(a, b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

positions :: Eq a => a -> [a] -> [Int]
positions x xs = find x (zip xs [0..n])
    where n = length xs - 1

-- ex 7

scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [x * y | (x, y) <- zip xs ys]

-- ex 8

-- let2int and int2let aren't used anymore, shift is changed to:

shift :: Int -> Char -> Char
shift n c | isAlpha c = chr (((ord c - b + n) `mod` 26) + b)
          | otherwise = c
    where b = ord (if isLower c then 'a' else 'A')
