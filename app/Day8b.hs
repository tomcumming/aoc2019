module Day8b where

import Data.List (sort)

import Day8 (layers)

mergePx :: Integer -> Integer -> Integer
mergePx a b = case a of
    2 -> b
    a -> a

merge :: [Integer] -> [Integer] -> [Integer]
merge xs ys = zipWith mergePx xs ys

printPx :: Integer -> String
printPx p = case p of
    0 -> " "
    1 -> "o"

printPic :: Int -> [Integer] -> String
printPic w px = case px of
    [] -> ""
    px -> concatMap printPx (take w px) ++ "\n" ++ printPic w (drop w px)

day8b :: Int -> Int -> String -> String
day8b w h contents = printPic w $ foldl1 merge $ layers (w * h) contents
