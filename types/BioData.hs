module BioData where
import qualified Data.Map as Map
import qualified Data.Char as Char

data Nucleotide = A | C | G | T | U deriving (Show, Eq, Ord)

data AminoAcid = Ala | Arg | Asn | Asp | Cys | Gln | Glu | Gly | His | Ile
               | Leu | Lys | Met | Phe | Pro | Ser | Thr | Trp | Tyr | Val
               | Stop deriving (Show)

data PolypeptideChain = Peptide AminoAcid PolypeptideChain | Nil deriving (Show)

type DNASequence = [Nucleotide] 
type RNASequence = [Nucleotide] 
type NucleotideSequence = [Nucleotide]

stringToNucleotides :: String -> NucleotideSequence 
stringToNucleotides "" = []
stringToNucleotides (x:xs) = case y of
                                'a' -> A : stringToNucleotides xs
                                'c' -> C : stringToNucleotides xs
                                'g' -> G : stringToNucleotides xs
                                't' -> T : stringToNucleotides xs
                                'u' -> U : stringToNucleotides xs
                                _  -> error "Invalid Nucleotide"
                             where y = Char.toLower x


rnaToPeptideMappings :: Map.Map RNASequence AminoAcid 
rnaToPeptideMappings = Map.fromList [
                            ([U,U,U], Phe),
                            ([U,U,C], Phe),
                            ([U,U,A], Leu),
                            ([U,U,G], Leu),
                            ([U,C,U], Ser),
                            ([U,C,C], Ser),
                            ([U,C,A], Ser),
                            ([U,C,G], Ser),
                            ([U,A,U], Tyr),
                            ([U,A,C], Tyr),
                            ([U,A,A], Stop),
                            ([U,A,G], Stop),
                            ([U,G,U], Cys),
                            ([U,G,C], Cys),
                            ([U,G,A], Stop),
                            ([U,G,C], Trp),
                            ([C,U,U], Leu),
                            ([C,U,C], Leu),
                            ([C,U,A], Leu),
                            ([C,U,G], Leu),
                            ([C,C,U], Pro),
                            ([C,C,C], Pro),
                            ([C,C,A], Pro),
                            ([C,C,G], Pro),
                            ([C,A,U], His),
                            ([C,A,C], His),
                            ([C,A,A], Gln),
                            ([C,A,G], Gln),
                            ([C,G,U], Arg),
                            ([C,G,C], Arg),
                            ([C,G,A], Arg),
                            ([C,G,G], Arg),
                            ([A,U,U], Ile),
                            ([A,U,C], Ile),
                            ([A,U,A], Ile),
                            ([A,U,G], Met),
                            ([A,C,U], Thr),
                            ([A,C,C], Thr),
                            ([A,C,A], Thr),
                            ([A,C,G], Thr),
                            ([A,A,U], Asn),
                            ([A,A,C], Asn),
                            ([A,A,A], Lys),
                            ([A,A,G], Lys),
                            ([A,G,U], Ser),
                            ([A,G,C], Ser),
                            ([A,G,A], Arg),
                            ([A,G,G], Arg),
                            ([G,U,U], Val),
                            ([G,U,C], Val),
                            ([G,U,A], Val),
                            ([G,U,G], Val),
                            ([G,C,U], Ala),
                            ([G,C,C], Ala),
                            ([G,C,A], Ala),
                            ([G,C,G], Ala),
                            ([G,A,U], Asp),
                            ([G,A,C], Asp),
                            ([G,A,A], Glu),
                            ([G,A,G], Glu),
                            ([G,G,U], Gly),
                            ([G,G,C], Gly),
                            ([G,G,A], Gly),
                            ([G,G,G], Gly)
                       ]
