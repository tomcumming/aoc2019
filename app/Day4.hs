module Day4 where

import Data.List.Split (splitOn)
import Data.Char (isSpace)

twoSame :: [Integer] -> Bool
twoSame ns = case ns of
    [] -> False
    [n] -> False
    (n:m:ns) -> n == m || twoSame (m:ns)

neverDecrease :: [Integer] -> Bool
neverDecrease ns = case ns of
    [] -> True
    [n] -> True
    (n:m:ns) -> n <= m && neverDecrease (m:ns)

inRange :: (Integer, Integer) -> [Integer] -> Bool
inRange (l, h) ns = l <= n && h >= n
    where
        n = read $ concatMap show ns

generate :: Integer -> [[Integer]]
generate l = case l of
    0 -> [[]]
    l -> filter neverDecrease $ concatMap (\p -> map (:p) [0..9]) $ generate (l - 1)

parseRange :: String -> (Integer, Integer)
parseRange s = (l, h)
    where
        [l, h] = map read $ splitOn "-" s

day4 contents = show $ length $ filter twoSame $ filter (inRange (l, h)) $ generate (fromIntegral $ length (show h))
    where
        (l, h) = parseRange $ filter (not . isSpace) contents
