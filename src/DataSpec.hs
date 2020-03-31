import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Val
import Pascal.Data

main ::IO()
main = hspec $ do
  describe "unsignedNumberEval" $ do 
    context "something" $ do
      it "convert a string into  Val data type" $ do
        interpret _ = "Not implemented"
