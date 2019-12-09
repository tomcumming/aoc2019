module Day6 where

import qualified Data.Map as Map
import Data.List.Split (splitOn)

orbits :: Map.Map String String -> String -> Integer
orbits ps k = case Map.lookup k ps of
    Nothing -> 0
    Just k -> 1 + orbits ps k

go :: Map.Map String String -> Integer
go ps = sum $ map (orbits ps) $ Map.keys ps

day6 contents = show $ go (Map.fromList pairs)
    where
        pairs = map (\[x, y] -> (y, x)) $ map (splitOn ")") $ lines contents
