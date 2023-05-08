module Utils where

import BioData

findRelativeFrequency :: NucleotideSequence -> [(Nucleotide, Double)]
findRelativeFrequency [] = []
findRelativeFrequency a = [(x,c) | x <-[A,C,G,T,U], 
    let c = (fromIntegral ((length.filter (==x)) a)) / (fromIntegral (length a)), c > 0]

getNucleotidesFromFile :: FilePath -> IO NucleotideSequence
getNucleotidesFromFile fp = do
    content <- readFile fp
    return (stringToNucleotides $ filter (/= '\n') content)
