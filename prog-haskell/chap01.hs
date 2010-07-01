--
-- Exercises from Chapter 1
--

-- 1.4

  -- No. The case when k^2 == n is handled by the first condition.

-- 1.6

  -- rem :: Integer -> Integer -> Integer

-- 1.9

maxInt :: [Int] -> Int
maxInt [] = error "empty list"
maxInt [x] = x
maxInt (x:xs) = max x (maxInt xs)

-- 1.10

removeFst :: Int -> [Int] -> [Int]
removeFst x [] = []
removeFst x (y:ys) | x == y = ys
                   | otherwise = y : (removeFst x ys)

-- 1.13

count :: Char -> String -> Int
count c [] = 0
count c (x:xs) | x == c = 1 + (count c xs)
               | otherwise = count c xs

-- 1.14

blowup :: String -> String
blowup xs = blowup0 1 xs

blowup0 :: Int -> String -> String
blowup0 i [] = []
blowup0 i (x:xs) = (printn i x) ++ (blowup0 (i + 1) xs)

printn :: Int -> Char -> String
printn 0 c = []
printn n c = [c] ++ (printn (n - 1) c)

-- 1.15

srtString :: [String] -> [String]
srtString [] = []
srtString xs = m : (srtString (rmFirst m xs) ) where m = minStr xs

rmFirst :: String -> [String] -> [String]
rmFirst x [] = []
rmFirst x (y:ys) | y == x = ys
                 | otherwise = y : (rmFirst x ys)

minStr :: [String] -> String
minStr [] = error "empty list"
minStr [x] = x
minStr (x:xs) = min x (minStr xs)

-- 1.17

prefix :: String -> String -> Bool
prefix [] ys = True
prefix (x:xs) [] = False
prefix (x:xs) (y:ys) = (x == y) && prefix xs ys

substring :: String -> String -> Bool
substring [] ys = True
substring (x:xs) [] = False
substring xs (y:ys) = prefix xs (y:ys) || substring xs ys

-- 1.20
 
lengths :: [[a]] -> [Int]
lengths xs = map length xs

-- 1.21

sumLengths :: [[a]] -> Int
sumLengths xs = sum (map length xs)
