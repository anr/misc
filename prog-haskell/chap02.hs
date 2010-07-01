-- ------------------------------------------------------------
-- Chapter 2
-- ------------------------------------------------------------

-- ex 3

{- 
  1 - functions should begin with a lowercase letter;
  2 - infix operators should be placed between backticks;
  3 - definitions should begin on the same column.
-}

n = a `div` length xs
    where
      a  = 10
      xs = [1, 2, 3, 4, 5]

-- ex 4

last1 xs = xs !! m
    where m = length xs - 1

last2 xs = head (drop m xs)
    where m = length xs - 1

-- ex 5

init1 xs = take m xs
    where m = length xs - 1

init2 xs = reverse (tail (reverse xs))
