"""Historical reenactment of the average 80's era U.S. highschooler"""

QUESTION = "Sure."
YELL = "Whoa, chill out!"
YELLED_QUESTION = "Calm down, I know what I'm doing!"
EMPTY = "Fine. Be that way!"
DEFAULT = "Whatever."

def hey(phrase):
    """Historical reenactment of the average 80's era U.S. highschooler"""
    stripped = phrase.strip()
    return (
        YELLED_QUESTION if stripped.isupper() and stripped.endswith('?')
        else QUESTION   if stripped.endswith('?')
        else YELL       if stripped.isupper()
        else EMPTY      if not stripped
        else DEFAULT
    )
