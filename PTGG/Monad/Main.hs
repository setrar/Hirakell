-- A function that returns a Maybe Int
half :: Int -> Maybe Int
half x = if even x then Just (x `div` 2) else Nothing

-- Chaining them together using the bind operator (>>=)
result :: Maybe Int
result = Just 20 >>= half >>= half >>= half
-- Just 20 -> Just 10 -> Just 5 -> Nothing (because 5 is odd)

routine :: Maybe Int
routine = do
    x <- Just 20
    y <- half x
    z <- half y
    half z
