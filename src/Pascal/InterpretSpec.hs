-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Data
import Pascal.Val
import Pascal.Data
import Pascal.Lexer
import Pascal.Data
import Pascal.Parser
import Interpret

main :: IO ()
main = hspec $ do
  describe "test event" $ do
    it "test name" $ do
        evalF ([], "x") (Real 3.0) `shouldBe` ([Real 3.0], "x")


