module Main where

import System.Environment (getArgs)

import Day1 (day1)
import Day1b (day1b)
import Day2 (day2)
import Day2b (day2b)
import Day3 (day3)
import Day4 (day4)
import Day4b (day4b)
import Day6 (day6)

main :: IO ()
main = do
    args <- getArgs
    contents <- getContents
    let result = case args of
                    ["1"] -> day1 contents
                    ["1b"] -> day1b contents
                    ["2"] -> day2 contents
                    ["2b"] -> day2b contents
                    ["3"] -> day3 contents
                    ["4"] -> day4 contents
                    ["4b"] -> day4b contents
                    ["6"] -> day6 contents
                    _ -> "Specify a day"
    putStrLn result
