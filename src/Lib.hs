module Lib
    ( bisectionMethod, chordMethod, f
    ) where

f n x
    | n == 1    = x*x*x - x - 4
    | n == 2    = x*x + sin (x - 1)
    | n == 3    = exp x - x - 2
    | otherwise = x - 4

df2 n x
    | n == 1    = 6*x
    | n == 2    = -sin (x - 1)
    | n == 3    = exp x
    | otherwise = 0

bisectionMethod n a b e = if a < b then bis a b else bis b a
    where err     = if e < 1e-15 then 1e-15 else e
          bis a b = let d = (b - a) / 2; m = (b + a) / 2 in
                    if d < err then
                        m
                    else if f n a * f n m < 0.0 then
                        bis a m
                    else
                        bis m b


chordMethod n a b e = if f n a * df2 n a < 0 then chord a b else chord b a
    where err     = if e < 1e-15 then 1e-15 else e
          chord x c = let x_next = x - f n x * (c - x) / (f n c - f n x) in
                    if abs (f n x_next) < err then
                        x_next
                    else
                        chord x_next c