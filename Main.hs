module Main where

import BioData
import Transform

myDNA :: DNASequence
myDNA = [A,T,C,G,A,A,A,A,A,A,A,A,A,A,A,A]

main :: IO()
main = 
    do
       putStrLn $ show $ translate $ transcribe myDNA 
       putStrLn $ show $ entropy myDNA
