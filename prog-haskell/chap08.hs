-- ------------------------------------------------------------
-- Chapter 8
-- ------------------------------------------------------------

-- ex 1

int1 :: Parser Int
int1 = do char '-'
          n <- nat
          return (-n)
       +++ nat

-- ex 2

notchar :: Char -> Parser Char
notchar x = sat(/= x)

comment :: Parser ()
comment = do symbol "--"
             many (notchar '\n')
             char '\n'
             return ()

-- ex 5

{-

Without the simplification, the grammar

(a) expr ::= term + expr | term
(b) term ::= factor * term | factor

is inneficient. Let's consider an expression consisting of a single
number. The first expansion of (a) would be tried. Recursively, the
first expansion of (b) would be tried. A "term" and a "factor" would
be parsed, but both expansions would fail. The second expasions of (a)
and (b) would be tried and succeed. This problem, of course, arises in
different types of expression.

The simplified ("factored") grammar (where "e" stands for the empty
string),

(c) expr :== term (+ expr | e)
(d) term :== factor (* term | e)

removes the redundancy. Now the expansions to "term" and "factor" can
succeed or fail with only one try.

-}

-- ex 6

expr :: Parser Int
expr =  do t <- term
           do symbol "+"               
              e <- expr
              return (t + e)
             +++ do symbol "-"
                    e <- expr
                    return(t - e)
                   +++ return t

term :: Parser Int
term =  do f <- factor
           do symbol "*"
              t <- term
              return (f * t)
             +++ do symbol "/"
                    t <- term
                    return (f `div` t)
                   +++ return f

-- ex 7

{-

New grammar:

expr   ::= term (+ expr | - expr | e)
term   ::= pow (* expr | / expr | e)
pow    ::= factor (^ factor | e)
factor ::= (expr) | nat
nat    ::= 0 | 1 | 2 | ...

-}

-- only change to the "term" parser: in the first line, try to parse a
-- "pow" instead of a "factor".

pow :: Parser Int
pow = do f1 <- factor
         do symbol "^"
            f2 <- factor
            return (f1 ^ f2)
           +++ return f1

-- ex 8

-- a

{-

Grammar:

expr ::= expr (- nat | e)
nat  ::= 0 | 1 | 2 | ...

-}

-- b

expr :: Parser Int
expr = do e <- expr
          do symbol "-"
             n <- natural
             return (e - n)
            +++ return e

-- c

-- This parser is infinitely recursive.

-- d

expr :: Parser Int
expr = do n <- natural
          ns <- many (do symbol "-"
                         natural)
          return (foldl (-) n ns)
