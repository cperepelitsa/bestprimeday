module Main where

import Control.Monad (forM_, (<=<))
import Data.Char (isDigit)
import Data.List (inits, tails, nub)
import Data.Numbers.Primes (isPrime)
import Data.Time.Calendar
import System.Environment (getArgs, getProgName)
import System.Exit (exitFailure)

daysInYear :: Integer -> [String]
daysInYear year =
    let startDate = fromGregorian year 1 1
        nthDay i = addDays i startDate
        isYear d = let (y, _, _) = toGregorian d in y == year
    in
        map (filter isDigit . showGregorian) . takeWhile isYear $ map nthDay [0..]

substrings :: String -> [String]
substrings = filter (/= "") . (tails <=< inits)

getPrimes :: String -> [Int]
getPrimes = filter isPrime . nub . map read . substrings

readMaybe :: Read a => String -> Maybe a
readMaybe s = case reads s of [(x,"")] -> Just x; _ -> Nothing

main :: IO ()
main = do
    year <- do
        argv <- getArgs
        execName <- getProgName
        if length argv /= 1 then do
            putStrLn $ execName ++ ": wrong number of arguments (expected 1)"
            putStrLn $ "usage: " ++ execName ++ " <year>"
            exitFailure
        else case readMaybe (head argv) of
            Just year -> return year :: IO Integer
            Nothing -> do
                putStrLn $ execName ++ ": invalid year: \"" ++ (head argv) ++ "\""
                exitFailure

    let getBestDates (numPrimes, pairs) (date, primes) =
            let numPrimes' = length primes in
            if numPrimes == numPrimes' then (numPrimes, (date,primes):pairs)
            else if numPrimes' > numPrimes then (numPrimes', [(date, primes)])
            else (numPrimes, pairs)
        primesForDays = map (\date -> (date, getPrimes date)) (daysInYear year)
        (bestN, bestPairs) = foldl getBestDates (0, []) primesForDays

    putStrLn $ show (length bestPairs) ++ " dates have " ++ show bestN ++ " primes in substrings:"
    forM_ bestPairs (\(date, primes) ->
        putStrLn $ date ++ ": " ++ show primes)
