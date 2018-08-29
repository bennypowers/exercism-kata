 {-# LANGUAGE UnicodeSyntax #-}
module EightDays (recite) where

num :: Int -> String
num 1 = "אחד אלוקינו שבשמים ובארץ."
num 2 = "שני לוחות הברית, "
num 3 = "שלושה אבות, "
num 4 = "ארבע אמהות, "
num 5 = "חמישה חומשי תורה, "
num 6 = "שישה סדרי משנה, "
num 7 = "שבעה ימי שבתא, "
num 8 = "שמונה ימי מילה, "
num 9 = "תשעה ירחי לידה, "
num 10 = "עשרה דיבריא, "
num 11 = "אחד עשר כוכביא, "
num 12 = "שתים עשר שבטיא, "
num 13 = "שלושה עשר מידיא, "

nums :: Int -> String
nums 0 = ""
nums x = num x ++ nums (x - 1)

verse :: Int -> String
verse 0 = ""
verse x = written x ++ " מי יודע? " ++ written x ++ " אני יודע! " ++ nums x
  where
    written 1 = "אחד"
    written 2 = "שנים"
    written 3 = "שלושה"
    written 4 = "ארבעה"
    written 5 = "חמישה"
    written 6 = "שישה"
    written 7 = "שבעה"
    written 8 = "שמונה"
    written 9 = "תשעה"
    written 10 = "עשרה"
    written 11 = "אחד עשר"
    written 12 = "שתים עשר"
    written 13 = "שלושה עשר"

recite :: Int -> Int -> [String]
recite start stop
  | start < stop = verse start : recite (start + 1) stop
  | start - stop == 0 = [verse start]
