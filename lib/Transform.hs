module Transform where

import BioData
import Utils
import qualified Data.Map as Map

transcribe :: DNASequence -> RNASequence
transcribe [] = []
transcribe (x:xs) = if x == T
                    then U : transcribe xs
                  else x : transcribe xs

transcribeReverse :: RNASequence -> DNASequence
transcribeReverse [] = []
transcribeReverse (x:xs) = if x == U
                    then T : transcribeReverse xs
                  else x : transcribeReverse xs

translate :: RNASequence -> PolypeptideChain
translate (x:y:z:xs) = Peptide (rnaToPeptideMappings Map.! arr) (translate xs)
                        where arr = [x,y,z]
translate _ = Nil 

entropy :: [Nucleotide] -> Double
entropy [] = 0
entropy x = abs $ entropyR $ findRelativeFrequency x

entropyR :: [(Nucleotide, Double)] -> Double
entropyR [] = 0
entropyR ((_, y):xs) = (y * logBase 2 y)  + entropyR xs
