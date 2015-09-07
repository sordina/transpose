module Main where

import Data.List.Split
import Data.List
import System.IO
import System.Exit
import System.Environment

main :: IO ()
main = getArgs >>= go

go ["-h"    ]  = help
go ["--help"]  = help
go ("--" :xs)  = go' xs
go xs          = go' xs

go' []     = interact (process "," ",")
go' [i]    = interact (process i i)
go' [i,o]  = interact (process i o)
go' _      = help >> exitFailure

process i o = unlines . map (intercalate o) . transpose . map (splitOn i) . lines

help = putStrLn "Usage: transpose [-h|--help] [--] [DELIM_IN] [DELIM_OUT]"
