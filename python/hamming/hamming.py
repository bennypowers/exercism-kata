"""
Measures the hamming distance between two DNA Strands
(represented as strings) of equal length.
"""

from functools import partial
from compose import compose

def match((fst, snd)):
    """Predicate of a Pair - are the members equal?"""
    return 1 if fst != snd else 0

def zip_chars(string_a, string_b):
    """Zips the characters in two strings"""
    return zip(list(string_a), list(string_b))

def distance(strand_a, strand_b):
    """Computes the distance between two strands"""
    to_matches = partial(map, match)
    sum_matches = compose(sum, to_matches)
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands are of different length")
    return sum_matches(zip_chars(strand_a, strand_b))
