module Day2 where

fuel :: Integer -> Integer
fuel n = case n of
    0 -> 0
    n -> let m = max 0 (div n 3 - 2) in m + fuel m

day2 = show . sum . map (fuel . read) . lines
