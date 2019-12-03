module Main where

import System.Environment (getArgs)

import Day1 (day1)

main :: IO ()
main = do
    args <- getArgs
    contents <- getContents
    let result = case args of
                    ("1":_) -> day1 contents
                    _ -> "Specify a day"
    putStrLn result
