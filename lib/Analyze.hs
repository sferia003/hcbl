module Analyze where

import Data.Array
import BioData
import Utils

entropy :: NucleotideSequence -> Double
entropy [] = 0
entropy x = fromIntegral (length x) * abs ( entropy' $ findRelativeFrequency x)

entropy' :: [(Nucleotide, Double)] -> Double
entropy' [] = 0
entropy' ((_, y):xs) = (y * logBase 2 y)  + entropy' xs

similarity :: NucleotideSequence -> NucleotideSequence -> Int
similarity = similarity' 1 1 1

similarity' :: Int -> Int -> Int -> NucleotideSequence -> NucleotideSequence -> Int
similarity' subc delc insc a b = dp (n, m) where
    n = length a
    m = length b

    t :: Array (Int, Int) Int
    t = array ((0,0), (n,m))  [(tuple, dp tuple) | tuple <- range ((0,0), (n,m))]

    dp (i,0) = i
    dp (0, j) = j
    dp (i,j) = if a !! (i - 1) == b !! (j - 1) 
                then t ! (i-1, j-1)
               else 
                   minimum [t ! (i-1,j) + delc, t ! (i,j-1) + insc, t ! (i-1,j-1) + subc]
