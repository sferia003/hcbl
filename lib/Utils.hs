module Utils where

import BioData

findRelativeFrequency :: [Nucleotide] -> [(Nucleotide, Double)]
findRelativeFrequency [] = []
findRelativeFrequency a = [(x,c) | x <-[A,C,G,T,U], 
    let c = (fromIntegral ((length.filter (==x)) a)) / (fromIntegral (length a)), c > 0]
