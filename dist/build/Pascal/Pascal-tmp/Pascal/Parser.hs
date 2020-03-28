{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: (Program) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> (Program)
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: (ProgramHeading) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> (ProgramHeading)
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: ([String]) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> ([String])
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (String) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> (String)
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: (Block) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> (Block)
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: (BlockOptions) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> (BlockOptions)
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: (VariableDeclarationPart) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> (VariableDeclarationPart)
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: (VariableDeclarationPartMultiple) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> (VariableDeclarationPartMultiple)
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: (VariableDeclaration) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> (VariableDeclaration)
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: ([Statement]) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> ([Statement])
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: ([Statement]) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> ([Statement])
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: (Statement) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> (Statement)
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: (IfStatement) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> (IfStatement)
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: (ConstList) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> (ConstList)
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: (Sign) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> (Sign)
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: (Constant) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> (Constant)
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: (CaseListElement) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> (CaseListElement)
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: (CaseListElements) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> (CaseListElements)
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (CaseStatement) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> (CaseStatement)
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyIn23 :: (ConditionalStatement) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> (ConditionalStatement)
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
happyIn24 :: (WhileStatement) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> (WhileStatement)
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
happyIn25 :: (RepeatStatement) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> (RepeatStatement)
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
happyIn26 :: (ForStatement) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> (ForStatement)
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
happyIn27 :: (ForList) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> (ForList)
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
happyIn28 :: (RepetetiveStatement) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> (RepetetiveStatement)
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
happyIn29 :: (Variable) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> (Variable)
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
happyIn30 :: (RecordVariableList) -> (HappyAbsSyn )
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn ) -> (RecordVariableList)
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
happyIn31 :: (WithStatement) -> (HappyAbsSyn )
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn ) -> (WithStatement)
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
happyIn32 :: (StructuredStatement) -> (HappyAbsSyn )
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn ) -> (StructuredStatement)
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
happyIn33 :: (UnlabelledStatement) -> (HappyAbsSyn )
happyIn33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn33 #-}
happyOut33 :: (HappyAbsSyn ) -> (UnlabelledStatement)
happyOut33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut33 #-}
happyIn34 :: (SimpleStatement) -> (HappyAbsSyn )
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn ) -> (SimpleStatement)
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
happyIn35 :: (ProcedureStatement) -> (HappyAbsSyn )
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn ) -> (ProcedureStatement)
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
happyIn36 :: (ParameterList) -> (HappyAbsSyn )
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn ) -> (ParameterList)
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
happyIn37 :: (ActualParameter) -> (HappyAbsSyn )
happyIn37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn37 #-}
happyOut37 :: (HappyAbsSyn ) -> (ActualParameter)
happyOut37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut37 #-}
happyIn38 :: (Expression) -> (HappyAbsSyn )
happyIn38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn38 #-}
happyOut38 :: (HappyAbsSyn ) -> (Expression)
happyOut38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut38 #-}
happyIn39 :: (SimpleExpression) -> (HappyAbsSyn )
happyIn39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn39 #-}
happyOut39 :: (HappyAbsSyn ) -> (SimpleExpression)
happyOut39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut39 #-}
happyIn40 :: (Term) -> (HappyAbsSyn )
happyIn40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn40 #-}
happyOut40 :: (HappyAbsSyn ) -> (Term)
happyOut40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut40 #-}
happyIn41 :: (SignedFactor) -> (HappyAbsSyn )
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn ) -> (SignedFactor)
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
happyIn42 :: (Factor) -> (HappyAbsSyn )
happyIn42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn42 #-}
happyOut42 :: (HappyAbsSyn ) -> (Factor)
happyOut42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut42 #-}
happyIn43 :: (FunctionDesignator) -> (HappyAbsSyn )
happyIn43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn43 #-}
happyOut43 :: (HappyAbsSyn ) -> (FunctionDesignator)
happyOut43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut43 #-}
happyIn44 :: (UnsignedConstant) -> (HappyAbsSyn )
happyIn44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn44 #-}
happyOut44 :: (HappyAbsSyn ) -> (UnsignedConstant)
happyOut44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut44 #-}
happyIn45 :: (UnsignedNumber) -> (HappyAbsSyn )
happyIn45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn45 #-}
happyOut45 :: (HappyAbsSyn ) -> (UnsignedNumber)
happyOut45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut45 #-}
happyIn46 :: (Int) -> (HappyAbsSyn )
happyIn46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn46 #-}
happyOut46 :: (HappyAbsSyn ) -> (Int)
happyOut46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut46 #-}
happyIn47 :: (Float) -> (HappyAbsSyn )
happyIn47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn47 #-}
happyOut47 :: (HappyAbsSyn ) -> (Float)
happyOut47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut47 #-}
happyIn48 :: (Set) -> (HappyAbsSyn )
happyIn48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn48 #-}
happyOut48 :: (HappyAbsSyn ) -> (Set)
happyOut48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut48 #-}
happyIn49 :: (ElementList) -> (HappyAbsSyn )
happyIn49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn49 #-}
happyOut49 :: (HappyAbsSyn ) -> (ElementList)
happyOut49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut49 #-}
happyIn50 :: (Element) -> (HappyAbsSyn )
happyIn50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn50 #-}
happyOut50 :: (HappyAbsSyn ) -> (Element)
happyOut50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut50 #-}
happyIn51 :: (Bool) -> (HappyAbsSyn )
happyIn51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn51 #-}
happyOut51 :: (HappyAbsSyn ) -> (Bool)
happyOut51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut51 #-}
happyIn52 :: (VType) -> (HappyAbsSyn )
happyIn52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn52 #-}
happyOut52 :: (HappyAbsSyn ) -> (VType)
happyOut52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut52 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x20\x00\x00\x52\x45\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x80\x82\x09\x40\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x20\x00\x00\x52\x45\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x80\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x03\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x0f\x80\x82\x09\x40\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x10\x00\x20\x00\x00\x52\x45\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x80\x00\x00\x48\x15\x01\x00\x00\x00\x00\x00\xc0\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x80\x82\x09\x40\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x80\x82\x09\x40\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x80\x82\x09\x40\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x80\x82\x09\x40\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x02\x00\x20\x55\x04\x00\x00\x00\x00\x00\x00\x3f\x80\x82\x09\x40\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x02\x00\x20\x55\x04\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x0a\x26\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x20\x00\x00\x52\x45\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x08\x00\x80\x54\x11\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf0\x03\x28\x98\x00\x04\x00\x00\x00\x00\x00\x00\x00\xc0\x0f\xa0\x60\x02\x10\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x08\x00\x80\x54\x11\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x02\x00\x20\x55\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParser","Program","ProgramHeading","IdentifierList","Identifier","Block","BlockOptions","VariableDeclarationPart","VariableDeclarationPartMultiple","VariableDeclaration","CompoundStatement","Statements","Statement","IfStatement","ConstList","Sign","Constant","CaseListElement","CaseListElements","CaseStatement","ConditionalStatement","WhileStatement","RepeatStatement","ForStatement","ForList","RepetetiveStatement","Variable","RecordVariableList","WithStatement","StructuredStatement","UnlabelledStatement","SimpleStatement","ProcedureStatement","ParameterList","ActualParameter","Expression","SimpleExpression","Term","SignedFactor","Factor","FunctionDesignator","UnsignedConstant","UnsignedNumber","UnsignedInteger","UnsignedReal","Set","ElementList","Element","Bool","VType","int","float","ID","st","'+'","'-'","'*'","'/'","'='","'<>'","'<'","'<='","'>'","'>='","'in'","'('","')'","'(.'","'.)'","'begin'","'end'","':='","':'","'true'","'false'","'and'","'or'","'not'","'var'","'bool'","'real'","'string'","','","';'","'.'","'program'","'div'","'mod'","'nil'","'if'","'then'","'else'","'case'","'of'","'while'","'do'","'repeat'","'until'","'for'","'assign'","'to'","'downto'","'with'","%eof"]
        bit_start = st * 106
        bit_end = (st + 1) * 106
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..105]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xe9\xff\xe9\xff\x2f\x00\x14\x00\xed\xff\xf9\xff\x00\x00\x04\x00\x16\x00\x00\x00\x00\x00\xfe\xff\x31\x00\x6f\x00\x7c\x00\xa2\x00\xbe\x00\x00\x00\xba\x00\xa6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x01\x00\x01\x00\xfe\xff\xcd\x00\xcd\x00\x00\x00\x00\x00\xcd\x00\x00\x00\xc0\x00\x00\x00\xc1\x00\xa5\x00\xb1\x00\xb4\x00\xd5\x00\x00\x00\xb9\x00\x82\x00\x09\x00\xbb\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xec\x02\xec\x02\x01\x00\x01\x00\x00\x00\x00\x00\xec\x02\x00\x00\xc7\x00\xbd\x00\xfe\xff\x00\x00\x01\x00\x00\x00\xf4\x00\xf4\x00\x3f\x00\xd6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfb\xff\xe2\x00\x00\x00\x00\x00\xfe\xff\x45\x00\x00\x00\x00\x00\xe7\x00\x00\x00\xea\x00\xeb\x00\x00\x00\x00\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\x01\x00\xfe\xff\x01\x00\x01\x00\x01\x00\xfe\xff\xfa\x00\xdc\x00\x00\x00\x00\x00\x00\x00\xdf\x00\xe1\xff\x00\x00\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf7\x00\x75\x00\xee\x00\xef\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe6\x00\x01\x00\x00\x00\x01\x00\x00\x00\xfb\x00\x00\x00\xfe\xff\x00\x00\xf8\x00\x45\x00\x45\x00\x00\x00\x00\x00\xfe\xff\x00\x00\x01\x00\x01\x00\xfe\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfe\xff\x00\x00\x09\x01\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x60\x00\x22\x01\xb3\x00\x21\x01\x00\x00\x00\x00\x00\x00\x00\x00\x1d\x01\x00\x00\x00\x00\x03\x03\xca\x00\x00\x00\x00\x00\x6d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9b\x00\xb2\x00\xc6\x00\x1a\x03\x24\x01\x05\x00\x00\x00\x00\x00\xa1\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x74\x02\x7e\x02\x13\x00\x2b\x00\x00\x00\x00\x00\x92\x02\x00\x00\x00\x00\x00\x00\x31\x03\x00\x00\x42\x00\x00\x00\x9f\x00\xb8\x00\xf5\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x56\x03\xbc\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0a\x02\x1e\x02\x35\x02\x49\x02\x60\x02\xc8\x01\xdf\x01\xf3\x01\xdd\x00\xf1\x00\x08\x01\x1c\x01\x33\x01\x47\x01\x5e\x01\x6d\x03\x59\x00\x72\x01\x70\x00\x7b\x03\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x89\x01\x00\x00\x87\x00\x00\x00\x00\x00\x00\x00\x92\x03\x00\x00\x00\x00\xc1\x02\xd0\x02\x00\x00\x00\x00\xa0\x03\x00\x00\x9d\x01\xb4\x01\xb7\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x48\x03\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf9\xff\x00\x00\x00\x00\xf6\xff\xf8\xff\xef\xff\x00\x00\x00\x00\xfb\xff\xf4\xff\xc6\xff\xcd\xff\x00\x00\xee\xff\xdb\xff\xda\xff\xcc\xff\xd4\xff\xd3\xff\xd2\xff\xcb\xff\xca\xff\xc8\xff\xec\xff\xc9\xff\xc7\xff\x00\x00\x00\x00\x00\x00\xef\xff\x00\x00\x00\x00\xf7\xff\xfe\xff\x00\x00\xfc\xff\x00\x00\xd1\xff\xd0\xff\x00\x00\x00\x00\x00\x00\xd1\xff\xab\xff\x00\x00\xc0\xff\xb8\xff\xb4\xff\xae\xff\xa9\xff\xa8\xff\xa3\xff\xa0\xff\x9f\xff\xa7\xff\xa5\xff\x9e\xff\x9d\xff\xa2\xff\x00\x00\x00\x00\x00\x00\x00\x00\x98\xff\x97\xff\x00\x00\xa1\xff\x00\x00\x00\x00\xef\xff\xf0\xff\x00\x00\xf5\xff\xf2\xff\x00\x00\x00\x00\x00\x00\x96\xff\x95\xff\x94\xff\xfa\xff\xf3\xff\x00\x00\xc4\xff\xc2\xff\xed\xff\x00\x00\x00\x00\xa6\xff\x99\xff\x00\x00\x9a\xff\x00\x00\x00\x00\xac\xff\xad\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfd\xff\xcf\xff\xce\xff\x00\x00\x00\x00\xd8\xff\x00\x00\xd9\xff\xb9\xff\xba\xff\xbb\xff\xbc\xff\xbd\xff\xbf\xff\xbe\xff\xb5\xff\xb6\xff\xb7\xff\xb0\xff\xb1\xff\xaf\xff\xb2\xff\xb3\xff\x9c\xff\xaa\xff\x9b\xff\xe3\xff\x00\x00\x00\x00\xe9\xff\xdf\xff\x00\x00\xe5\xff\xe1\xff\xe7\xff\xe6\xff\xeb\xff\x00\x00\xc5\xff\x00\x00\xf1\xff\xc3\xff\xc1\xff\x00\x00\xdd\xff\x00\x00\x00\x00\x00\x00\xe2\xff\xe4\xff\x00\x00\xa4\xff\x00\x00\x00\x00\x00\x00\xd7\xff\xd5\xff\xd6\xff\xe0\xff\xe8\xff\xde\xff\xef\xff\xea\xff\x00\x00\xdc\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x03\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x03\x00\x10\x00\x03\x00\x03\x00\x11\x00\x24\x00\x05\x00\x06\x00\x11\x00\x10\x00\x14\x00\x12\x00\x33\x00\x34\x00\x03\x00\x03\x00\x15\x00\x18\x00\x19\x00\x22\x00\x21\x00\x1c\x00\x19\x00\x1a\x00\x21\x00\x19\x00\x1a\x00\x36\x00\x1b\x00\x22\x00\x28\x00\x23\x00\x27\x00\x2b\x00\x14\x00\x2d\x00\x19\x00\x2f\x00\x03\x00\x31\x00\x29\x00\x2a\x00\x2b\x00\x35\x00\x03\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x14\x00\x19\x00\x03\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x1d\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x2f\x00\x19\x00\x03\x00\x1e\x00\x1f\x00\x20\x00\x00\x00\x01\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x02\x00\x03\x00\x2f\x00\x19\x00\x03\x00\x07\x00\x08\x00\x01\x00\x02\x00\x03\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x17\x00\x17\x00\x2f\x00\x19\x00\x03\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x21\x00\x03\x00\x2f\x00\x19\x00\x02\x00\x03\x00\x02\x00\x03\x00\x03\x00\x07\x00\x08\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\x04\x00\x05\x00\x06\x00\x02\x00\x03\x00\x09\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x22\x00\x03\x00\x2f\x00\x19\x00\x02\x00\x03\x00\x10\x00\x15\x00\x03\x00\x11\x00\x08\x00\x2e\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\x21\x00\x32\x00\x30\x00\x10\x00\x29\x00\x2e\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2c\x00\x03\x00\x2f\x00\x19\x00\x03\x00\x22\x00\x17\x00\x13\x00\x11\x00\x11\x00\x03\x00\x22\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\x2e\x00\x17\x00\x21\x00\x2a\x00\x22\x00\x17\x00\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x15\x00\x03\x00\x2f\x00\x19\x00\x2a\x00\x01\x00\x03\x00\x30\x00\x09\x00\x03\x00\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x22\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\x03\x00\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\x03\x00\x2f\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\xff\xff\xff\xff\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\xff\xff\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\xff\xff\x19\x00\xff\xff\xff\xff\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\xff\xff\xff\xff\x2f\x00\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x19\x00\xff\xff\x2f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x26\x00\x27\x00\x28\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x03\x00\xff\xff\x2f\x00\x07\x00\x08\x00\x03\x00\xff\xff\xff\xff\xff\xff\xff\xff\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x03\x00\xff\xff\x1a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x0d\x00\x0e\x00\x0f\x00\x25\x00\x26\x00\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x01\x00\x02\x00\x03\x00\x04\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x10\x00\xff\xff\x12\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x18\x00\x19\x00\x03\x00\xff\xff\x1c\x00\xff\xff\xff\xff\xff\xff\x09\x00\x0a\x00\x0b\x00\x0c\x00\xff\xff\xff\xff\xff\xff\x27\x00\xff\xff\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\xff\xff\x18\x00\xff\xff\x03\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\xff\xff\x18\x00\xff\xff\x03\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\xff\xff\x18\x00\xff\xff\x03\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x09\x00\x18\x00\x0b\x00\x0c\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\xff\xff\x18\x00\xff\xff\x03\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x09\x00\xff\xff\x0b\x00\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x09\x00\x18\x00\x0b\x00\x0c\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\xff\xff\x18\x00\xff\xff\x03\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x09\x00\xff\xff\x0b\x00\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\x03\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\x09\x00\x18\x00\x0b\x00\x0c\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\xff\xff\x18\x00\xff\xff\x03\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x09\x00\xff\xff\x0b\x00\x0c\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x12\x00\x13\x00\x14\x00\x15\x00\x16\x00\xff\xff\x18\x00\xff\xff\xff\xff\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x07\x00\x3f\x00\x40\x00\x07\x00\x41\x00\x42\x00\x43\x00\x2b\x00\x29\x00\xac\x00\x2b\x00\xa3\x00\x04\x00\x6c\x00\x6d\x00\xb0\x00\x44\x00\x0c\x00\x45\x00\xb1\x00\xb2\x00\x30\x00\x07\x00\xa9\x00\x46\x00\x47\x00\x2a\x00\xa4\x00\x48\x00\x2c\x00\x2d\x00\xa4\x00\x2c\x00\x7d\x00\xff\xff\x6e\x00\xaa\x00\x21\x00\x28\x00\x49\x00\x22\x00\x0c\x00\x23\x00\x31\x00\x24\x00\x30\x00\x25\x00\xad\x00\x3a\x00\x3b\x00\x26\x00\x07\x00\x62\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x63\x00\x61\x00\x3d\x00\x0c\x00\x31\x00\x30\x00\x3f\x00\x40\x00\x07\x00\x9e\x00\x9f\x00\xa0\x00\x0d\x00\x5f\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x60\x00\x61\x00\x3d\x00\x31\x00\x30\x00\x54\x00\x55\x00\x56\x00\x04\x00\x02\x00\x58\x00\x59\x00\x5a\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x0d\x00\x0e\x00\x3d\x00\x31\x00\x30\x00\x4e\x00\x4f\x00\x3f\x00\x40\x00\x07\x00\x82\x00\x59\x00\x5a\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x52\x00\x7f\x00\x3d\x00\x31\x00\x30\x00\x6f\x00\x70\x00\x71\x00\x72\x00\x73\x00\x74\x00\x75\x00\x80\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x51\x00\x30\x00\x3d\x00\x31\x00\x0d\x00\x0e\x00\x2a\x00\x0e\x00\x07\x00\x57\x00\x4f\x00\xa5\x00\x5a\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x07\x00\x08\x00\x09\x00\x56\x00\x0e\x00\x0a\x00\x4a\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x4c\x00\x30\x00\x3d\x00\x31\x00\x0d\x00\x0e\x00\x4e\x00\x4d\x00\x07\x00\x7c\x00\x0f\x00\x7a\x00\x49\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x7b\x00\x79\x00\x78\x00\x77\x00\x5d\x00\x76\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x5e\x00\x30\x00\x3d\x00\x31\x00\x07\x00\xa5\x00\xa2\x00\x96\x00\x95\x00\x94\x00\x07\x00\x7d\x00\x8a\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\xb3\x00\xaf\x00\xac\x00\xa8\x00\xab\x00\xa2\x00\x89\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\xbd\x00\x30\x00\x3d\x00\x31\x00\xba\x00\x02\x00\x05\x00\x52\x00\x26\x00\x2e\x00\x00\x00\x00\x00\x88\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x87\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x86\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x85\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x84\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x81\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa6\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb5\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb4\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8d\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8c\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8b\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x92\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x91\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x90\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x30\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8f\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x30\x00\x3d\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x8e\x00\x35\x00\x36\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x00\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x31\x00\x00\x00\x00\x00\x65\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x00\x00\x00\x00\x3d\x00\x64\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x31\x00\x00\x00\x3d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5e\x00\x37\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x3c\x00\x96\x00\x00\x00\x3d\x00\x67\x00\x68\x00\x96\x00\x00\x00\x00\x00\x00\x00\x00\x00\x97\x00\x98\x00\x99\x00\x9a\x00\x9b\x00\x97\x00\x98\x00\x99\x00\x9a\x00\xb8\x00\x96\x00\x00\x00\x69\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb7\x00\x98\x00\x99\x00\x6a\x00\x6b\x00\x00\x00\x00\x00\x00\x00\x9c\x00\x3a\x00\x3b\x00\x00\x00\x00\x00\x9c\x00\x3a\x00\x3b\x00\x3f\x00\x40\x00\x07\x00\x41\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9c\x00\x3a\x00\x3b\x00\x44\x00\x00\x00\x45\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x46\x00\x47\x00\x10\x00\x00\x00\x48\x00\x00\x00\x00\x00\x00\x00\x11\x00\x12\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x49\x00\x00\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x10\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x11\x00\x2f\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x10\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x11\x00\x5b\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x10\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x11\x00\xbb\x00\x13\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x11\x00\x1a\x00\xa0\x00\x14\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x10\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x11\x00\x00\x00\x83\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x11\x00\x1a\x00\x7e\x00\x14\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x10\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x11\x00\x00\x00\xba\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x11\x00\x1a\x00\xb6\x00\x14\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x10\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x11\x00\x00\x00\xb3\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x00\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 107) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97),
	(98 , happyReduce_98),
	(99 , happyReduce_99),
	(100 , happyReduce_100),
	(101 , happyReduce_101),
	(102 , happyReduce_102),
	(103 , happyReduce_103),
	(104 , happyReduce_104),
	(105 , happyReduce_105),
	(106 , happyReduce_106),
	(107 , happyReduce_107)
	]

happy_n_terms = 55 :: Int
happy_n_nonterms = 49 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_1 = happySpecReduce_3  0# happyReduction_1
happyReduction_1 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn4
		 (ProgramBlock happy_var_1 happy_var_2
	)}}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_2 = happyReduce 6# 1# happyReduction_2
happyReduction_2 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut7 happy_x_2 of { happy_var_2 -> 
	case happyOut6 happy_x_4 of { happy_var_4 -> 
	happyIn5
		 (ProgramHeadingWithList happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_3 = happySpecReduce_3  1# happyReduction_3
happyReduction_3 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_2 of { happy_var_2 -> 
	happyIn5
		 (ProgramHeadingWithoutList happy_var_2
	)}

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_4 = happySpecReduce_1  2# happyReduction_4
happyReduction_4 happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 ([happy_var_1]
	)}

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_5 = happySpecReduce_3  2# happyReduction_5
happyReduction_5 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	case happyOut6 happy_x_3 of { happy_var_3 -> 
	happyIn6
		 (happy_var_1:happy_var_3
	)}}

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_6 = happySpecReduce_1  3# happyReduction_6
happyReduction_6 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn7
		 (happy_var_1
	)}

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_7 = happySpecReduce_1  4# happyReduction_7
happyReduction_7 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn8
		 (BlockCopoundStatement happy_var_1
	)}

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_8 = happySpecReduce_2  4# happyReduction_8
happyReduction_8 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	case happyOut13 happy_x_2 of { happy_var_2 -> 
	happyIn8
		 (BlockVariableDeclarationPart happy_var_1 happy_var_2
	)}}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_9 = happySpecReduce_1  5# happyReduction_9
happyReduction_9 happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	happyIn9
		 (BlockOptionsVariableDeclarationPart happy_var_1
	)}

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_10 = happySpecReduce_3  6# happyReduction_10
happyReduction_10 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_2 of { happy_var_2 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn10
		 (VariableDeclarationPartMultiple happy_var_2 happy_var_3
	)}}

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_11 = happySpecReduce_2  6# happyReduction_11
happyReduction_11 happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_2 of { happy_var_2 -> 
	happyIn10
		 (VariableDeclarationPartSingle happy_var_2
	)}

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_12 = happySpecReduce_2  7# happyReduction_12
happyReduction_12 happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn11
		 (VariableDeclarationPartMultipleMultiple happy_var_1 happy_var_2
	)}}

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_13 = happySpecReduce_1  7# happyReduction_13
happyReduction_13 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn11
		 (VariableDeclarationPartMultipleSingle happy_var_1
	)}

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_14 = happyReduce 4# 8# happyReduction_14
happyReduction_14 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut52 happy_x_3 of { happy_var_3 -> 
	happyIn12
		 (VariableDeclarationMain happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_15 = happySpecReduce_3  9# happyReduction_15
happyReduction_15 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_2 of { happy_var_2 -> 
	happyIn13
		 (happy_var_2
	)}

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_16 = happySpecReduce_0  10# happyReduction_16
happyReduction_16  =  happyIn14
		 ([]
	)

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_17 = happySpecReduce_1  10# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	happyIn14
		 ([happy_var_1]
	)}

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_18 = happySpecReduce_3  10# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	case happyOut14 happy_x_3 of { happy_var_3 -> 
	happyIn14
		 (happy_var_1:happy_var_3
	)}}

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_19 = happySpecReduce_1  11# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOut33 happy_x_1 of { happy_var_1 -> 
	happyIn15
		 (StatementUnlabelledStatement happy_var_1
	)}

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_20 = happyReduce 4# 12# happyReduction_20
happyReduction_20 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut38 happy_x_2 of { happy_var_2 -> 
	case happyOut15 happy_x_4 of { happy_var_4 -> 
	happyIn16
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_21 = happyReduce 6# 12# happyReduction_21
happyReduction_21 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut38 happy_x_2 of { happy_var_2 -> 
	case happyOut15 happy_x_4 of { happy_var_4 -> 
	case happyOut15 happy_x_6 of { happy_var_6 -> 
	happyIn16
		 (IfElse happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_22 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_22 = happySpecReduce_1  13# happyReduction_22
happyReduction_22 happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (ConstListSingle happy_var_1
	)}

happyReduce_23 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_23 = happySpecReduce_3  13# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_3 of { happy_var_3 -> 
	happyIn17
		 (ConstListMultiple happy_var_1 happy_var_3
	)}}

happyReduce_24 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_24 = happySpecReduce_1  14# happyReduction_24
happyReduction_24 happy_x_1
	 =  happyIn18
		 (SignPos
	)

happyReduce_25 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_25 = happySpecReduce_1  14# happyReduction_25
happyReduction_25 happy_x_1
	 =  happyIn18
		 (SignNeg
	)

happyReduce_26 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_26 = happySpecReduce_1  15# happyReduction_26
happyReduction_26 happy_x_1
	 =  case happyOut45 happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (ConstantUN happy_var_1
	)}

happyReduce_27 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_27 = happySpecReduce_2  15# happyReduction_27
happyReduction_27 happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	case happyOut45 happy_x_2 of { happy_var_2 -> 
	happyIn19
		 (ConstantSUN happy_var_1 happy_var_2
	)}}

happyReduce_28 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_28 = happySpecReduce_1  15# happyReduction_28
happyReduction_28 happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (ConstantI happy_var_1
	)}

happyReduce_29 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_29 = happySpecReduce_2  15# happyReduction_29
happyReduction_29 happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_2 of { happy_var_2 -> 
	happyIn19
		 (ConstantSI happy_var_1 happy_var_2
	)}}

happyReduce_30 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_30 = happySpecReduce_1  15# happyReduction_30
happyReduction_30 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenSt happy_var_1)) -> 
	happyIn19
		 (ConstantS happy_var_1
	)}

happyReduce_31 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_31 = happySpecReduce_3  16# happyReduction_31
happyReduction_31 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { happy_var_1 -> 
	case happyOut15 happy_x_3 of { happy_var_3 -> 
	happyIn20
		 (CaseListElementSingle happy_var_1 happy_var_3
	)}}

happyReduce_32 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_32 = happySpecReduce_1  17# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	happyIn21
		 (CaseListElementsSingle happy_var_1
	)}

happyReduce_33 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_33 = happySpecReduce_3  17# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	case happyOut21 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 (CaseListElementsMultiple happy_var_1 happy_var_3
	)}}

happyReduce_34 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_34 = happyReduce 5# 18# happyReduction_34
happyReduction_34 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut38 happy_x_2 of { happy_var_2 -> 
	case happyOut21 happy_x_4 of { happy_var_4 -> 
	happyIn22
		 (Case happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_35 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_35 = happyReduce 8# 18# happyReduction_35
happyReduction_35 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut38 happy_x_2 of { happy_var_2 -> 
	case happyOut21 happy_x_4 of { happy_var_4 -> 
	case happyOut14 happy_x_7 of { happy_var_7 -> 
	happyIn22
		 (CaseElse happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest}}}

happyReduce_36 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_36 = happySpecReduce_1  19# happyReduction_36
happyReduction_36 happy_x_1
	 =  case happyOut16 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 (ConditionalStatementIf happy_var_1
	)}

happyReduce_37 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_37 = happySpecReduce_1  19# happyReduction_37
happyReduction_37 happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 (ConditionalStatementCase happy_var_1
	)}

happyReduce_38 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_38 = happyReduce 4# 20# happyReduction_38
happyReduction_38 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut38 happy_x_2 of { happy_var_2 -> 
	case happyOut15 happy_x_4 of { happy_var_4 -> 
	happyIn24
		 (WhileS happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_39 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_39 = happyReduce 4# 21# happyReduction_39
happyReduction_39 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_2 of { happy_var_2 -> 
	case happyOut38 happy_x_4 of { happy_var_4 -> 
	happyIn25
		 (Repeat happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_40 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_40 = happyReduce 6# 22# happyReduction_40
happyReduction_40 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut7 happy_x_2 of { happy_var_2 -> 
	case happyOut27 happy_x_4 of { happy_var_4 -> 
	case happyOut15 happy_x_6 of { happy_var_6 -> 
	happyIn26
		 (For happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_41 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_41 = happySpecReduce_3  23# happyReduction_41
happyReduction_41 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut38 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn27
		 (ForListTo happy_var_1 happy_var_3
	)}}

happyReduce_42 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_42 = happySpecReduce_3  23# happyReduction_42
happyReduction_42 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut38 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn27
		 (ForListDownTo happy_var_1 happy_var_3
	)}}

happyReduce_43 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_43 = happySpecReduce_1  24# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut24 happy_x_1 of { happy_var_1 -> 
	happyIn28
		 (RepetetiveStatementWhile happy_var_1
	)}

happyReduce_44 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_44 = happySpecReduce_1  24# happyReduction_44
happyReduction_44 happy_x_1
	 =  case happyOut25 happy_x_1 of { happy_var_1 -> 
	happyIn28
		 (RepetetiveStatementRepeat happy_var_1
	)}

happyReduce_45 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_45 = happySpecReduce_1  24# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	happyIn28
		 (RepetetiveStatementFor happy_var_1
	)}

happyReduce_46 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_46 = happySpecReduce_1  25# happyReduction_46
happyReduction_46 happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn29
		 (Var happy_var_1
	)}

happyReduce_47 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_47 = happySpecReduce_1  26# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	happyIn30
		 (RecordVariableListSingle happy_var_1
	)}

happyReduce_48 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_48 = happySpecReduce_3  26# happyReduction_48
happyReduction_48 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn30
		 (RecordVariableListMultiple happy_var_1 happy_var_3
	)}}

happyReduce_49 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_49 = happyReduce 4# 27# happyReduction_49
happyReduction_49 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut15 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (With happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_50 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_50 = happySpecReduce_1  28# happyReduction_50
happyReduction_50 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn32
		 (StructuredStatementCompoundStatement happy_var_1
	)}

happyReduce_51 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_51 = happySpecReduce_1  28# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	happyIn32
		 (StructuredStatementConditionalStatement happy_var_1
	)}

happyReduce_52 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_52 = happySpecReduce_1  28# happyReduction_52
happyReduction_52 happy_x_1
	 =  case happyOut28 happy_x_1 of { happy_var_1 -> 
	happyIn32
		 (StructuredStatementRepetetiveStatement happy_var_1
	)}

happyReduce_53 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_53 = happySpecReduce_1  28# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOut31 happy_x_1 of { happy_var_1 -> 
	happyIn32
		 (StructuredStatementWithStatement happy_var_1
	)}

happyReduce_54 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_54 = happySpecReduce_1  29# happyReduction_54
happyReduction_54 happy_x_1
	 =  case happyOut34 happy_x_1 of { happy_var_1 -> 
	happyIn33
		 (UnlabelledStatementSimpleStatement happy_var_1
	)}

happyReduce_55 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_55 = happySpecReduce_1  29# happyReduction_55
happyReduction_55 happy_x_1
	 =  case happyOut32 happy_x_1 of { happy_var_1 -> 
	happyIn33
		 (UnlabelledStatementStructuredStatement happy_var_1
	)}

happyReduce_56 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_56 = happySpecReduce_1  30# happyReduction_56
happyReduction_56 happy_x_1
	 =  case happyOut35 happy_x_1 of { happy_var_1 -> 
	happyIn34
		 (PS happy_var_1
	)}

happyReduce_57 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_57 = happySpecReduce_1  31# happyReduction_57
happyReduction_57 happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn35
		 (SingleProcedureStatement happy_var_1
	)}

happyReduce_58 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_58 = happyReduce 4# 31# happyReduction_58
happyReduction_58 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut7 happy_x_1 of { happy_var_1 -> 
	case happyOut36 happy_x_3 of { happy_var_3 -> 
	happyIn35
		 (MultiProcedureStatement happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_59 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_59 = happySpecReduce_1  32# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOut37 happy_x_1 of { happy_var_1 -> 
	happyIn36
		 (ParameterListSingle happy_var_1
	)}

happyReduce_60 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_60 = happySpecReduce_3  32# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut36 happy_x_1 of { happy_var_1 -> 
	case happyOut37 happy_x_3 of { happy_var_3 -> 
	happyIn36
		 (ParameterListMulitiple happy_var_1 happy_var_3
	)}}

happyReduce_61 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_61 = happySpecReduce_1  33# happyReduction_61
happyReduction_61 happy_x_1
	 =  case happyOut38 happy_x_1 of { happy_var_1 -> 
	happyIn37
		 (ActualParameterSingle happy_var_1
	)}

happyReduce_62 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_62 = happySpecReduce_3  33# happyReduction_62
happyReduction_62 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut37 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn37
		 (ActualParameterMultiple happy_var_1 happy_var_3
	)}}

happyReduce_63 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_63 = happySpecReduce_1  34# happyReduction_63
happyReduction_63 happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	happyIn38
		 (ExpressionSingle happy_var_1
	)}

happyReduce_64 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_64 = happySpecReduce_3  34# happyReduction_64
happyReduction_64 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (ExpressionMultipleNE happy_var_1 happy_var_3
	)}}

happyReduce_65 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_65 = happySpecReduce_3  34# happyReduction_65
happyReduction_65 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (ExpressionMultipleE happy_var_1 happy_var_3
	)}}

happyReduce_66 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_66 = happySpecReduce_3  34# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (ExpressionMultipleLT happy_var_1 happy_var_3
	)}}

happyReduce_67 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_67 = happySpecReduce_3  34# happyReduction_67
happyReduction_67 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (ExpressionMultipleLTE happy_var_1 happy_var_3
	)}}

happyReduce_68 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_68 = happySpecReduce_3  34# happyReduction_68
happyReduction_68 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (ExpressionMultipleGT happy_var_1 happy_var_3
	)}}

happyReduce_69 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_69 = happySpecReduce_3  34# happyReduction_69
happyReduction_69 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (ExpressionMultipleGTE happy_var_1 happy_var_3
	)}}

happyReduce_70 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_70 = happySpecReduce_3  34# happyReduction_70
happyReduction_70 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut38 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (ExpressionMultipleIN happy_var_1 happy_var_3
	)}}

happyReduce_71 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_71 = happySpecReduce_1  35# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut40 happy_x_1 of { happy_var_1 -> 
	happyIn39
		 (SingleExpressionTermSingle happy_var_1
	)}

happyReduce_72 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_72 = happySpecReduce_3  35# happyReduction_72
happyReduction_72 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut40 happy_x_1 of { happy_var_1 -> 
	case happyOut39 happy_x_3 of { happy_var_3 -> 
	happyIn39
		 (SingleExpressionTermMultipleAdd happy_var_1 happy_var_3
	)}}

happyReduce_73 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_73 = happySpecReduce_3  35# happyReduction_73
happyReduction_73 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut40 happy_x_1 of { happy_var_1 -> 
	case happyOut39 happy_x_3 of { happy_var_3 -> 
	happyIn39
		 (SingleExpressionTermMultipleSub happy_var_1 happy_var_3
	)}}

happyReduce_74 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_74 = happySpecReduce_3  35# happyReduction_74
happyReduction_74 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut40 happy_x_1 of { happy_var_1 -> 
	case happyOut39 happy_x_3 of { happy_var_3 -> 
	happyIn39
		 (SingleExpressionTermMultipleOr happy_var_1 happy_var_3
	)}}

happyReduce_75 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_75 = happySpecReduce_1  36# happyReduction_75
happyReduction_75 happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	happyIn40
		 (TermSingle happy_var_1
	)}

happyReduce_76 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_76 = happySpecReduce_3  36# happyReduction_76
happyReduction_76 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	case happyOut40 happy_x_3 of { happy_var_3 -> 
	happyIn40
		 (TermMultipleMult happy_var_1 happy_var_3
	)}}

happyReduce_77 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_77 = happySpecReduce_3  36# happyReduction_77
happyReduction_77 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	case happyOut40 happy_x_3 of { happy_var_3 -> 
	happyIn40
		 (TermMultipleDivision happy_var_1 happy_var_3
	)}}

happyReduce_78 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_78 = happySpecReduce_3  36# happyReduction_78
happyReduction_78 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	case happyOut40 happy_x_3 of { happy_var_3 -> 
	happyIn40
		 (TermMultipleDiv happy_var_1 happy_var_3
	)}}

happyReduce_79 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_79 = happySpecReduce_3  36# happyReduction_79
happyReduction_79 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	case happyOut40 happy_x_3 of { happy_var_3 -> 
	happyIn40
		 (TermMultipleMod happy_var_1 happy_var_3
	)}}

happyReduce_80 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_80 = happySpecReduce_3  36# happyReduction_80
happyReduction_80 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	case happyOut40 happy_x_3 of { happy_var_3 -> 
	happyIn40
		 (TermMultipleAnd happy_var_1 happy_var_3
	)}}

happyReduce_81 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_81 = happySpecReduce_1  37# happyReduction_81
happyReduction_81 happy_x_1
	 =  case happyOut42 happy_x_1 of { happy_var_1 -> 
	happyIn41
		 (SignedFactorDefault happy_var_1
	)}

happyReduce_82 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_82 = happySpecReduce_2  37# happyReduction_82
happyReduction_82 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn41
		 (SignedFactorPlus happy_var_2
	)}

happyReduce_83 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_83 = happySpecReduce_2  37# happyReduction_83
happyReduction_83 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn41
		 (SignedFactorMinus happy_var_2
	)}

happyReduce_84 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_84 = happySpecReduce_1  38# happyReduction_84
happyReduction_84 happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	happyIn42
		 (FactorVariable happy_var_1
	)}

happyReduce_85 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_85 = happySpecReduce_3  38# happyReduction_85
happyReduction_85 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut38 happy_x_2 of { happy_var_2 -> 
	happyIn42
		 (FactorExpression happy_var_2
	)}

happyReduce_86 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_86 = happySpecReduce_1  38# happyReduction_86
happyReduction_86 happy_x_1
	 =  case happyOut43 happy_x_1 of { happy_var_1 -> 
	happyIn42
		 (FactorFD happy_var_1
	)}

happyReduce_87 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_87 = happySpecReduce_1  38# happyReduction_87
happyReduction_87 happy_x_1
	 =  case happyOut44 happy_x_1 of { happy_var_1 -> 
	happyIn42
		 (FactorUC happy_var_1
	)}

happyReduce_88 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_88 = happySpecReduce_1  38# happyReduction_88
happyReduction_88 happy_x_1
	 =  case happyOut48 happy_x_1 of { happy_var_1 -> 
	happyIn42
		 (FactorSe happy_var_1
	)}

happyReduce_89 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_89 = happySpecReduce_2  38# happyReduction_89
happyReduction_89 happy_x_2
	happy_x_1
	 =  case happyOut42 happy_x_2 of { happy_var_2 -> 
	happyIn42
		 (FactorNot happy_var_2
	)}

happyReduce_90 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_90 = happySpecReduce_1  38# happyReduction_90
happyReduction_90 happy_x_1
	 =  case happyOut51 happy_x_1 of { happy_var_1 -> 
	happyIn42
		 (FactorBool happy_var_1
	)}

happyReduce_91 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_91 = happyReduce 4# 39# happyReduction_91
happyReduction_91 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut7 happy_x_1 of { happy_var_1 -> 
	case happyOut36 happy_x_3 of { happy_var_3 -> 
	happyIn43
		 (FDesignate happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_92 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_92 = happySpecReduce_1  40# happyReduction_92
happyReduction_92 happy_x_1
	 =  case happyOut45 happy_x_1 of { happy_var_1 -> 
	happyIn44
		 (UN happy_var_1
	)}

happyReduce_93 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_93 = happySpecReduce_1  40# happyReduction_93
happyReduction_93 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenSt happy_var_1)) -> 
	happyIn44
		 (Str happy_var_1
	)}

happyReduce_94 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_94 = happySpecReduce_1  40# happyReduction_94
happyReduction_94 happy_x_1
	 =  happyIn44
		 (Nil
	)

happyReduce_95 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_95 = happySpecReduce_1  41# happyReduction_95
happyReduction_95 happy_x_1
	 =  case happyOut46 happy_x_1 of { happy_var_1 -> 
	happyIn45
		 (UI happy_var_1
	)}

happyReduce_96 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_96 = happySpecReduce_1  41# happyReduction_96
happyReduction_96 happy_x_1
	 =  case happyOut47 happy_x_1 of { happy_var_1 -> 
	happyIn45
		 (UR happy_var_1
	)}

happyReduce_97 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_97 = happySpecReduce_1  42# happyReduction_97
happyReduction_97 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenInt happy_var_1)) -> 
	happyIn46
		 (happy_var_1
	)}

happyReduce_98 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_98 = happySpecReduce_1  43# happyReduction_98
happyReduction_98 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenFloat happy_var_1)) -> 
	happyIn47
		 (happy_var_1
	)}

happyReduce_99 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_99 = happySpecReduce_3  44# happyReduction_99
happyReduction_99 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut49 happy_x_2 of { happy_var_2 -> 
	happyIn48
		 (SetElement happy_var_2
	)}

happyReduce_100 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_100 = happySpecReduce_3  44# happyReduction_100
happyReduction_100 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut49 happy_x_2 of { happy_var_2 -> 
	happyIn48
		 (SetElement2 happy_var_2
	)}

happyReduce_101 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_101 = happySpecReduce_1  45# happyReduction_101
happyReduction_101 happy_x_1
	 =  case happyOut50 happy_x_1 of { happy_var_1 -> 
	happyIn49
		 (ElementListElemntSingle [happy_var_1]
	)}

happyReduce_102 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_102 = happySpecReduce_1  46# happyReduction_102
happyReduction_102 happy_x_1
	 =  case happyOut38 happy_x_1 of { happy_var_1 -> 
	happyIn50
		 (ElementExpression happy_var_1
	)}

happyReduce_103 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_103 = happySpecReduce_1  47# happyReduction_103
happyReduction_103 happy_x_1
	 =  happyIn51
		 (True
	)

happyReduce_104 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_104 = happySpecReduce_1  47# happyReduction_104
happyReduction_104 happy_x_1
	 =  happyIn51
		 (False
	)

happyReduce_105 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_105 = happySpecReduce_1  48# happyReduction_105
happyReduction_105 happy_x_1
	 =  happyIn52
		 (BOOL
	)

happyReduce_106 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_106 = happySpecReduce_1  48# happyReduction_106
happyReduction_106 happy_x_1
	 =  happyIn52
		 (REAL
	)

happyReduce_107 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_107 = happySpecReduce_1  48# happyReduction_107
happyReduction_107 happy_x_1
	 =  happyIn52
		 (STRING
	)

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	Token _ TokenEOF -> happyDoAction 54# tk action sts stk;
	Token _ (TokenInt happy_dollar_dollar) -> cont 1#;
	Token _ (TokenFloat happy_dollar_dollar) -> cont 2#;
	Token _ (TokenID happy_dollar_dollar) -> cont 3#;
	Token _ (TokenSt happy_dollar_dollar) -> cont 4#;
	Token _ (TokenOp "+") -> cont 5#;
	Token _ (TokenOp "-") -> cont 6#;
	Token _ (TokenOp "*") -> cont 7#;
	Token _ (TokenOp "/") -> cont 8#;
	Token _ (TokenOp "=") -> cont 9#;
	Token _ (TokenOp "<>") -> cont 10#;
	Token _ (TokenOp "<") -> cont 11#;
	Token _ (TokenOp "<=") -> cont 12#;
	Token _ (TokenOp ">") -> cont 13#;
	Token _ (TokenOp ">=") -> cont 14#;
	Token _ (TokenOp "in") -> cont 15#;
	Token _ (TokenK  "(") -> cont 16#;
	Token _ (TokenK  ")") -> cont 17#;
	Token _ (TokenK  "(.") -> cont 18#;
	Token _ (TokenK  ".)") -> cont 19#;
	Token _ (TokenK "begin") -> cont 20#;
	Token _ (TokenK "end") -> cont 21#;
	Token _ (TokenOp ":=") -> cont 22#;
	Token _ (TokenOp ":") -> cont 23#;
	Token _ (TokenK "true") -> cont 24#;
	Token _ (TokenK "false") -> cont 25#;
	Token _ (TokenK "and") -> cont 26#;
	Token _ (TokenK "or") -> cont 27#;
	Token _ (TokenK "not") -> cont 28#;
	Token _ (TokenK "var") -> cont 29#;
	Token _ (TokenK "bool") -> cont 30#;
	Token _ (TokenK "real") -> cont 31#;
	Token _ (TokenK "string") -> cont 32#;
	Token _ (TokenK ",") -> cont 33#;
	Token _ (TokenK ";") -> cont 34#;
	Token _ (TokenK ".") -> cont 35#;
	Token _ (TokenK "program") -> cont 36#;
	Token _ (TokenK "div") -> cont 37#;
	Token _ (TokenK "mod") -> cont 38#;
	Token _ (TokenK "nil") -> cont 39#;
	Token _ (TokenK "if") -> cont 40#;
	Token _ (TokenK "then") -> cont 41#;
	Token _ (TokenK "else") -> cont 42#;
	Token _ (TokenK "case") -> cont 43#;
	Token _ (TokenK "of") -> cont 44#;
	Token _ (TokenK "while") -> cont 45#;
	Token _ (TokenK "do") -> cont 46#;
	Token _ (TokenK "repeat") -> cont 47#;
	Token _ (TokenK "until") -> cont 48#;
	Token _ (TokenK "for") -> cont 49#;
	Token _ (TokenK "assign") -> cont 50#;
	Token _ (TokenK "to") -> cont 51#;
	Token _ (TokenK "downto") -> cont 52#;
	Token _ (TokenK "with") -> cont 53#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 54# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen = (thenP)
happyReturn :: () => a -> Parser a
happyReturn = (returnP)
happyParse :: () => Happy_GHC_Exts.Int# -> Parser (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn ))

happyThen1 :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen1 = happyThen
happyReturn1 :: () => a -> Parser a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> Parser a
happyError' tk = (\(tokens, explist) -> happyError) tk
happyParser = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (happyOut4 x))

happySeq = happyDontSeq



{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc8380_0/ghc_2.h" #-}


























































































































































































{-# LINE 11 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}


          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}


                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+#  i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 180 "templates\\\\GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+#  nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+#  nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
