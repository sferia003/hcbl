module BioData where

data Nucleotide = A | C | G | T | U deriving (Show)

data AminoAcid = Ala | Arg | Asn | Asp | Cys | Gln | Glu | Gly | His | Ile
               | Leu | Lys | Met | Phe | Pro | Ser | Thr | Trp | Tyr | Val
                 deriving (Show)

data PolypeptideChain = Peptide AminoAcid PolypeptideChain | Nil deriving (Show)

type DNASequence = [Nucleotide] 
type RNASequence = [Nucleotide] 
