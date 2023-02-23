
func1 :: Int->String
func1 x | x == 1 = "Paseo Exclusivo"
        | x == 2 = "Paseo de a dos"
        | x == 3 = "Paseo Triple"
        | x == 4 = "Paseo de dos pares"
        | x == 5 = "Paseo Quintuple"
        |otherwise = "Paseo No definido."

func2 :: [Int] -> Int -> Int -> [Int]
func2 [] _ _ = []
func2 (h:t) min max = if (min <= h) && (h <= max) then func2(t) min max  else  h:func2(t) min max


func3 :: [Int] -> Int ->Int
func3 [] _ = 0
func3 (h:t) val = if h<=val then 1+func3(t) val else func3(t) val                     