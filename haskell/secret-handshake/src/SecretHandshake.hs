module SecretHandshake (handshake) where

strings :: Int -> [String]
strings n
  | n >= 8 = strings (n - 8) ++ ["jump" ]
  | n >= 4 = strings (n - 4) ++ ["close your eyes" ]
  | n >= 2 = strings (n - 2) ++ ["double blink" ]
  | n == 1 = strings (n - 1) ++ ["wink" ]
  | otherwise = []

handshake :: Int -> [String]
handshake n
  | n >= 16 = reverse $ strings (n - 16)
  | otherwise = strings n
