module Main where

import Control.Monad (forM_, (<=<))
import Data.Char (isDigit)
import Data.List (inits, tails, nub)
import Data.Numbers.Primes (isPrime)
import Data.Time.Calendar

allDates :: [String]
allDates =
    let startDate = fromGregorian 2016 1 1
        nthDay i = addDays i startDate
        is2016 d = let (y, _, _) = toGregorian d in y == 2016
    in
        map (filter isDigit . showGregorian) . takeWhile is2016 $ map nthDay [0..]

substrings :: String -> [String]
substrings = filter (/= "") . (tails <=< inits)

getPrimes :: String -> [Int]
getPrimes = filter isPrime . nub . map read . substrings

main :: IO ()
main =
    let getBestDates (numPrimes, pairs) (date, primes) =
            let numPrimes' = length primes in
            if numPrimes == numPrimes' then (numPrimes, (date,primes):pairs)
            else if numPrimes' > numPrimes then (numPrimes', [(date, primes)])
            else (numPrimes, pairs)
        (bestN, bestPairs) = foldl getBestDates (0, []) $ map (\date -> (date, getPrimes date)) allDates
    in do
        putStrLn $ show (length bestPairs) ++ " dates have " ++ show bestN ++ " primes in substrings:"
        forM_ bestPairs (\(date, primes) ->
            putStrLn $ date ++ ": " ++ show primes)
