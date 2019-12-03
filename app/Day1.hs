module Day1 where

day1 contents = show $ sum $ map (\l -> div (read l) 3 - 2) $ lines contents
