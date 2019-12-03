module Main where

import System.Environment (getArgs)

import Day1 (day1)
import Day2 (day2)

main :: IO ()
main = do
    args <- getArgs
    contents <- getContents
    let result = case args of
                    ["1"] -> day1 contents
                    ["2"] -> day2 contents
                    _ -> "Specify a day"
    putStrLn result
