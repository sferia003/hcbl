module Main where

import Transform
import Analyze
import Utils

main :: IO()
main = 
    do
       ts <- getNucleotidesFromFile "test.txt"
       t2s <- getNucleotidesFromFile "test2.txt"
       let entropyT = entropy ts
       let entropyT2 = entropy t2s
       let sim = similarity ts t2s
       let rnaT = transcribe ts
       let polyT = translate rnaT
       print entropyT
       print entropyT2
       print ts
       print rnaT
       print polyT
       print sim
