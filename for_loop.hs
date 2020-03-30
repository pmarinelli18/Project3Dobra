import Control.Monad (unless)
 
for (x:xs) f = do
  f x
  unless (null xs) $ for xs f
 
main = for [1..10] (\i -> putStrLn ("Hello: " ++ show i))

