-- This file contains the data-structures for the AST
-- The role of the parser is to build the AST (Abstract Syntax Tree) 

module Pascal.Data
    (
        Bool(..),
        UnsignedNumber(..),
        UnsignedConstant(..),
        FunctionDesignator(..),
        Variable(..),
        Factor(..),
        Multiplicativeoperator(..),
        SignedFactor(..),
        Term(..),
        Relationaloperator(..),
        SimpleExpression(..),
        Expression(..),
        ActualParameter(..),
        ParameterList(..),
        SimpleStatement(..),
        UnlabelledStatement(..),
        ProcedureStatement(..),
        Element(..),
        ElementList(..),
        Set(..),
        ProgramHeading(..),
        VType(..),
        Block(..),
        BlockOptions(..),
        VariableDeclarationPart(..),
        VariableDeclarationPartMultiple(..),
        VariableDeclaration(..),
        Statement(..),
        IfStatement(..),
        ConstList(..),
        Sign(..),
        Constant(..),
        CaseListElement(..),
        CaseListElements(..),
        CaseStatement(..),
        ConditionalStatement(..),
        RepeatStatement(..),
        ForStatement(..),
        ForList(..),
        RepetetiveStatement(..),
        RecordVariableList(..),
        WithStatement(..),
        WhileStatement(..),
        StructuredStatement(..),

        Program(..)
    ) where


data VariableDeclarationPart =
    VariableDeclarationPartSingle VariableDeclaration
    |VariableDeclarationPartMultiple VariableDeclaration VariableDeclarationPartMultiple

data VariableDeclarationPartMultiple =
    VariableDeclarationPartMultipleSingle VariableDeclaration
    |VariableDeclarationPartMultipleMultiple VariableDeclaration VariableDeclarationPartMultiple

data VariableDeclaration = 
    VariableDeclarationMain [String] VType

data Block =
    BlockCopoundStatement [Statement]
    | BlockVariableDeclarationPart BlockOptions [Statement]

data BlockOptions =
    BlockOptionsVariableDeclarationPart VariableDeclarationPart

data UnsignedNumber =
    UI Int
    |UR Float

data UnsignedConstant = 
    UN UnsignedNumber
    | Str String
    | Nil

data FunctionDesignator =
    FDesignate String ParameterList

data Factor =
    FactorVariable Variable
    | FactorExpression Expression
    | FactorFD FunctionDesignator
    | FactorUC UnsignedConstant
    | FactorSe Set
    | FactorNot Factor
    | FactorBool Bool

data Set =
    SetElement ElementList
    |SetElement2 ElementList

data ElementList =
    ElementListElemntSingle [Element]
    | ElementListElemntMultiple [Element]

data Element =
    ElementExpression Expression

data Multiplicativeoperator =
    MultiplicativeoperatorMultiplication
    | MultiplicativeoperatorDivision
    | MultiplicativeoperatorDiv
    | MultiplicativeoperatorMod
    | MultiplicativeoperatorAnd

data SignedFactor =
    SignedFactorDefault Factor
    | SignedFactorPlus Factor
    | SignedFactorMinus  Factor

data Term =
    TermSingle SignedFactor
    | TermMultipleMult SignedFactor Term
    | TermMultipleDivision SignedFactor Term
    | TermMultipleDiv SignedFactor Term
    | TermMultipleMod SignedFactor Term
    | TermMultipleAnd SignedFactor Term

data Relationaloperator =
    RelationaloperatorE
    | RelationaloperatorNE
    | RelationaloperatorLT
    | RelationaloperatorLTE
    | RelationaloperatorGT
    | RelationaloperatorGTE
    | RelationaloperatorIN 

data SimpleExpression = 
    SingleExpressionTermSingle Term
    | SingleExpressionTermMultipleAdd Term SimpleExpression
    | SingleExpressionTermMultipleSub Term SimpleExpression
    | SingleExpressionTermMultipleOr Term SimpleExpression

data Expression =
    ExpressionSingle SimpleExpression 
    | ExpressionMultipleNE SimpleExpression Expression
    | ExpressionMultipleE SimpleExpression Expression
    | ExpressionMultipleLT SimpleExpression Expression
    | ExpressionMultipleLTE SimpleExpression Expression
    | ExpressionMultipleGT SimpleExpression Expression
    | ExpressionMultipleGTE SimpleExpression Expression
    | ExpressionMultipleIN SimpleExpression Expression

data ActualParameter =
    ActualParameterSingle Expression 
    | ActualParameterMultiple ActualParameter Expression

data ParameterList =
    ParameterListSingle ActualParameter
    | ParameterListMulitiple ParameterList ActualParameter

data SimpleStatement =
    PS ProcedureStatement

data IfStatement =
    If Expression Statement
    |IfElse Expression Statement Statement

data Sign =
    SignPos 
    | SignNeg

data Constant =
    ConstantUN UnsignedNumber
    |ConstantSUN Sign UnsignedNumber
    |ConstantI  String
    |ConstantSI Sign String
    |ConstantS String

data ConstList =
    ConstListSingle Constant
    |ConstListMultiple Constant ConstList

data CaseListElement =
    CaseListElementSingle ConstList Statement

data CaseListElements =
    CaseListElementsSingle CaseListElement 
    |CaseListElementsMultiple CaseListElement CaseListElements

data CaseStatement =
    Case Expression CaseListElements
    |CaseElse Expression CaseListElements [Statement]


data ConditionalStatement =
    ConditionalStatementIf IfStatement
    | ConditionalStatementCase CaseStatement

data WhileStatement =
    WhileS Expression Statement

data RepeatStatement =
    Repeat [Statement] Expression

data ForStatement =
    For String ForList Statement

data ForList =
    ForListTo Expression Expression
    | ForListDownTo Expression Expression

data RepetetiveStatement =
    RepetetiveStatementWhile WhileStatement
    | RepetetiveStatementRepeat RepeatStatement
    | RepetetiveStatementFor ForStatement

data Variable = 
    Var String

data RecordVariableList =
    RecordVariableListSingle Variable
    | RecordVariableListMultiple Variable RecordVariableList

data WithStatement =
    With RecordVariableList Statement

data StructuredStatement =
    StructuredStatementCompoundStatement [Statement]
    | StructuredStatementConditionalStatement ConditionalStatement
    | StructuredStatementRepetetiveStatement RepetetiveStatement
    | StructuredStatementWithStatement WithStatement

data UnlabelledStatement =
    UnlabelledStatementSimpleStatement SimpleStatement
    | UnlabelledStatementStructuredStatement StructuredStatement

data Statement = 
    StatementUnlabelledStatement UnlabelledStatement

data ProcedureStatement =
    SingleProcedureStatement String
    | MultiProcedureStatement String ParameterList

data Program = 
    ProgramBlock ProgramHeading Block

data ProgramHeading =
    ProgramHeadingWithList String [String]
    | ProgramHeadingWithoutList String

data VType = 
    REAL 
    | BOOL 
    | STRING;


        -- Data-structure for  numeric expressions
--data Exp = 
            -- unary operator: Op name expression
    -- Op1 String Exp
            -- binary operator: Op name leftExpression rightExpression
    -- | Op2 String Exp Exp
            -- function call: FunctionCall name ListArguments
    -- | FunCall String [Exp]
            -- real value: e.g. Real 1.0
    -- | Real Float
            -- variable: e.g. Var "x"
    -- | Var String


-- Data-structure for boolean expressions
--data BoolExp = 
            -- binary operator on boolean expressions
    -- OpB String BoolExp BoolExp
            -- negation, the only unary operator
    -- | Not BoolExp
            -- comparison operator: Comp name expression expression
    -- | Comp String Exp Exp
            -- true and false constants
    -- | True_C
    -- | False_C
    -- |Var_B String


-- Data-structure for statements
--data Statement = 
            -- TODO: add other statements
            -- Variable assignment
    -- Assign String Exp
            -- If statement
    -- | If BoolExp Statement Statement
                -- Block
    -- | Block [Statement]



--added from dobra


-- data Definition = 
            -- Variable definition, list of var, type
    --VarDef [String] VType
            -- Procedures
    -- | Proc String [(String, VType)] Statement
            --added from dobra



-- Data-structure for hole program
-- TODO: add declarations and other useful stuff
-- Hint: make a tuple containing the other ingredients
