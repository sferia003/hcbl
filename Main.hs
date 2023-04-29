module Main where

import BioData
import Transform

myDNA :: DNASequence
myDNA = [A,T,T,A,A,A,G,G,T, T]

main :: IO()
main = 
    do
       putStrLn $ show $ translate $ transcribe myDNA 
