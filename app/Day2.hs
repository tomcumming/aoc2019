module Day2 where

import Data.List.Split (splitOn)
import qualified Data.Map as Map

run :: Map.Map Integer Integer -> Integer -> Map.Map Integer Integer
run ns ip = case ns Map.! ip of
    1 -> let
            px = (ns Map.! (ip + 1))
            py = (ns Map.! (ip + 2))
            pz = (ns Map.! (ip + 3))
            ns' = Map.insert pz ((ns Map.! px) + (ns Map.! py)) ns
         in run ns' (ip + 4)
    2 -> let
            px = (ns Map.! (ip + 1))
            py = (ns Map.! (ip + 2))
            pz = (ns Map.! (ip + 3))
            ns' = Map.insert pz ((ns Map.! px) * (ns Map.! py)) ns
        in run ns' (ip + 4)
    99 -> ns

day2 contents = show $ run (Map.fromList $ zip [0..] $ map read $ splitOn "," contents) 0
