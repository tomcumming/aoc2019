module Day2b where

import qualified Data.Map as Map
import Data.List.Split (splitOn)
import Data.List (find)

import Day2 (run)

target = 19690720

setup initial noun verb = Map.insert 1 noun (Map.insert 2 verb initial)

day2b contents = show $
    let
        initial = (Map.fromList $ zip [0..] $ map read $ splitOn "," contents) :: Map.Map Integer Integer
        tests = [ (noun, verb) | noun <- [0..100], verb <- [0..100]]
    in find (\(noun, verb) ->
        let
            result = run (setup initial noun verb) 0
            out = result Map.! 0
        in out == target) tests
