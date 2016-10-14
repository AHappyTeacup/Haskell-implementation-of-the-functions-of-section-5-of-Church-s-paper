-- QUESTION 2 (a)
---------------------------------------------------------------------------
-- Theorem IV

-- F a recursive funtion of two positive integers. Where for each x, there exists a y such that F(x,y)>1
-- This f_2 is a test function to see if my code was actually working.
f_2 :: Int -> Int -> Int
f_2 _ 10 = 4
f_2 _ _ = 1

i :: Int -> Int -> Int
i 1 2 = 2
i x 2 = 1
i x 1 = 3
i x y = 3

j :: Int -> Int -> Int
j 1 y = y
j x y = x-1

g :: Int ->  Int -> Int
g x 1 = i (f_2 x 1) 2
g x y = i (f_2 x y) (g x (y-1))

h :: Int -> Int -> Int
h y x = if g x y == 1 then j 1 y else h (y+1) x

-- F*, such that for each positive integer x, F*(x) returns the least positive integer y such that F(x,y)>1
f :: Int -> Int
f x = h 1 x

---------------------------------------------------------------------------
-- Theorem V

-- F a recursive function of 1 positive integer.
-- This f_1 is a  test function to see if my code was actually working.
f_1 :: Int -> Int
f_1 x = if (mod x 20) == 0 then 2 else 1

-- inner loop.
il :: Int -> Int -> Int
il 1 y = il (f_1 (y+1)) (y+1)
il x y = y

-- F^0(n), that determines the n'th number x for which F(x)>1. (Outer loop)
ol :: Int -> Int
ol 1 = il 1 1
ol k = (il 1 (ol (k-1)))

main :: IO()
main = print $ ol 5

---------------------------------------------------------------------------