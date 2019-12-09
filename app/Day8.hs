module Day8 where

import Data.List (minimumBy)

layerSort :: [Integer] -> [Integer] -> Ordering
layerSort xs ys = compare (f xs) (f ys)
    where
        f = length . filter (== 0)

layers :: Int -> String -> [[Integer]]
layers size contents = case contents of
    "" -> []
    contents -> map (read . return) (take size contents) : layers size (drop size contents)

go :: [[Integer]] -> Int
go layers =
    let l = minimumBy layerSort layers
    in (length $ filter (== 1) l) * (length $ filter (== 2) l)

day8 size contents = show $ go $ layers size contents
