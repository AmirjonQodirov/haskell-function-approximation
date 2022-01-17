module Main where

import Lib

main :: IO ()
main = do
    putStrLn "-----WELCOME!-----"
    putStrLn "Please choose a function: "
    putStrLn "Enter 1 for  ---  F(x) = x^3 - x - 4"
    putStrLn "Enter 2 for  ---  F(x) = x^2 + sin(x-1)"
    putStrLn "Enter 3 for  ---  F(x) = e^x - x - 2"
    putStrLn "Enter 4 for  ---  F(x) = x - 4"
    funcN <- getLine
    putStrLn "Now choose a method: "
    putStrLn "Enter 1 for  ---  Bisection Method"
    putStrLn "Enter 2 for  ---  Chord Method"
    methodN <- getLine
    let func = (read funcN :: Int)
    let method = (read methodN :: Int)
    putStrLn "Now input a left border(a): "
    aInput <- getLine
    putStrLn "Now input a right border(b): "
    bInput <- getLine
    putStrLn "Now input a epsilon: "
    epsInput <- getLine
    let a = (read aInput :: Double)
    let b = (read bInput :: Double)
    let eps = (read epsInput :: Double)
    putStrLn "..."
    if method == 1 then do
        let ansX = bisectionMethod func a b eps
        let ansY = f func ansX
        putStrLn $ "x = " ++ show ansX
        putStrLn $  "f(x) = " ++ show ansY
    else do
        let ansX = chordMethod func a b eps
        let ansY = f func ansX
        putStrLn $ "x = " ++ show ansX
        putStrLn $  "f(x) = " ++ show ansY