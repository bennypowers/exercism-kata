module DNA (toRNA) where

transcribe :: Char -> Maybe Char
transcribe 'G' = Just 'C'
transcribe 'C' = Just 'G'
transcribe 'T' = Just 'A'
transcribe 'A' = Just 'U'
transcribe _ = Nothing

toRNA :: String -> Maybe String
toRNA = traverse transcribe
