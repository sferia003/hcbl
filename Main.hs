module Main where

import BioData

myRna :: RNASequence
myRna = [A, U, G, C, U, A, G, C]

main :: IO()

main = 
    do
       putStrLn $ show myRna 
