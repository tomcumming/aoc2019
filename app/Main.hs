module Main where

import System.Environment (getArgs)

import Day1 (day1)
import Day1b (day1b)
import Day2 (day2)
import Day3 (day3)

main :: IO ()
main = do
    args <- getArgs
    contents <- getContents
    let result = case args of
                    ["1"] -> day1 contents
                    ["1b"] -> day1b contents
                    ["2"] -> day2 contents
                    ["3"] -> day3 contents
                    _ -> "Specify a day"
    putStrLn result
