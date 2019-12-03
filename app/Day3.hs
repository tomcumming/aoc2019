module Day3 where

import qualified Data.Map as Map
import Data.List.Split (splitOn)
import Data.Maybe (fromMaybe)

type Pos = (Integer, Integer)
type Wires = Map.Map Pos Integer

followWire :: Pos -> Wires -> Char -> Integer -> (Pos, Wires)
followWire (x, y) w d l = case (l, d) of
    (0, _) -> ((x, y), w)
    (l, 'U') -> let p' = (x, y + 1) in followWire p' (Map.alter (Just . (+ 1) . fromMaybe 0) p' w) 'U' (l - 1)
    (l, 'D') -> let p' = (x, y - 1) in followWire p' (Map.alter (Just . (+ 1) . fromMaybe 0) p' w) 'D' (l - 1)
    (l, 'L') -> let p' = (x - 1, y) in followWire p' (Map.alter (Just . (+ 1) . fromMaybe 0) p' w) 'L' (l - 1)
    (l, 'R') -> let p' = (x + 1, y) in followWire p' (Map.alter (Just . (+ 1) . fromMaybe 0) p' w) 'R' (l - 1)

addWire :: Pos -> Wires -> [String] -> Wires
addWire p w is = case is of
    [] -> w
    ((d:ns):is) -> let (p', w') = followWire p w d (read ns) in addWire p' w' is

addWires :: [String] -> Wires
addWires lines = case lines of
    [] -> Map.empty
    (line:lines) -> addWire (0, 0) (addWires lines) (splitOn "," line)

closestCross :: Wires -> Integer
closestCross = minimum . map (\((x, y), _) -> abs x + abs y) . filter ((> 1) . snd) . Map.toList

day3 = show . closestCross . addWires . lines
