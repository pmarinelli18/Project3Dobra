import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Val
import Pascal.Data

main ::IO()
main = hspec $ do
    describe "strToVal" $ do 
        it "convert a string into  Val data type" $ do
            strToVal "Val"  `shouldBe` Id "Val"
