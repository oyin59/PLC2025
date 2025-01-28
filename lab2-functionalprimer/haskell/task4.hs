ask :: String ->Int -> IO ()
ask prompt n =
  do
  putStrLn (prompt ++ replicate n '!')
  line <- getLine
  if line == "quit"
    then putStrLn "quitting..."
    else if line == ""
      then ask prompt (n + 1)
      else do
         putStrLn ("you said: " ++ reverse line)

main :: IO ()
main =
  do
  let prompt = "please say something"
  ask prompt 0