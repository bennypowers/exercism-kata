module House (rhyme) where

finale :: String
finale = "This is the horse and the hound and the horn\n\
  \that belonged to the farmer sowing his corn\n\
  \that kept the rooster that crowed in the morn\n\
  \that woke the priest all shaven and shorn\n\
  \that married the man all tattered and torn\n\
  \that kissed the maiden all forlorn\n\
  \that milked the cow with the crumpled horn\n\
  \that tossed the dog\n\
  \that worried the cat\n\
  \that killed the rat\n\
  \that ate the malt\n\
  \that lay in the house that Jack built.\n"

rhyme :: String
rhyme = map l
  where ls = lines finale
