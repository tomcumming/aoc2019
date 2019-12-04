module Day4b where

import Data.List (group)
import Data.Char (isSpace)

import Day4

twoSame' :: [Integer] -> Bool
twoSame' = any ((== 2) . length) . group

day4b contents = show $ length $ filter twoSame' $ filter (inRange (l, h)) $ generate (fromIntegral $ length (show h))
    where
        (l, h) = parseRange $ filter (not . isSpace) contents
