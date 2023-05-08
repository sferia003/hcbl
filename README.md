# Haskell Computational Biology Library (HCBL)

A simple library that allows one to import sequences and transform/analyze them.

## Use

Run `make` to generate an example executable. `Main.hs` serves an example to demonstrate
use of the library.

## Things To Note

- Translation does not account for start and end codons.
- The entropy calculation works by assuming that the distribution in the
string is representative of the probability distribution of the selection of
amino acids. It uses the relative proportion to assume the absolute distribution.
It finally multiplies the average number of bits to the length of the 
sequence to get the average level of information for the entire sequence.
- The similarity calculation uses edit distance to calculate the similarity between
two sequences. Hence, a small number means that these sequences are similar and a large
number means they are relatively different. Note that we provide a simple `similarity` and
a more granular `similarity'` with weighted substitution cost, deletion cost, and insertion cost.

