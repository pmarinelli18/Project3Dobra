{
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
}


%name happyParser
%tokentype { Token }

%monad { Parser } { thenP } { returnP }
%lexer { lexer } { Token _ TokenEOF }

%token
        int             { Token _ (TokenInt $$) }
        ID              { Token _ (TokenID $$)  }
        '+'             { Token _ (TokenOp "+")   }
        '-'             { Token _ (TokenOp "-")   }
        '*'             { Token _ (TokenOp "*")   }
        '/'             { Token _ (TokenOp "/")   }
        '='             { Token _ (TokenOp "=")   }
        '('             { Token _ (TokenK  "(")   }
        ')'             { Token _ (TokenK  ")")   }
        'begin'         { Token _ (TokenK "begin") }
        'end'           { Token _ (TokenK "end")  }
        ':='            { Token _ (TokenK ":=")   }
        'true'          { Token _ (TokenK "true") }
        'false'         { Token _ (TokenK "false") }
        'and'           { Token _ (TokenK "and") }
        'not'           { Token _ (TokenK "not") }
        'var'           { Token _ (TokenK "var") }
        ':'             { Token _ (TokenK ":") }
        'bool'          { Token _ (TokenType "bool") }
        'real'          { Token _ (TokenType "real") }
        'string'        { Token _ (TokenType "string") }
        ','             { Token _ (TokenK ",") }
        ';'             { Token _ (TokenK ";") }
        '.'             { Token _ (TokenK ".") }
        'program'       { Token _ (TokenK "program") }

-- associativity of operators in reverse precedence order
%nonassoc '>' '>=' '<' '<=' '==' '!='
%left '+' '-'
%left '*' '/'
%nonassoc ':='
%%

-- Entry point
Program :: {Program}
    : Block '.' { $1 }   
    --: ProgramHeading Block '.' { $2 }

--ProgramHeading :: {}
    --:'program' ID '(' IdentifierList ')' ';'
    --|'program' ID ';'

IdentiferList:: {[String]}
    :ID{[$1]}
    |ID ',' IdentiferList { $1:$3 }


Block:: {[Statement]}
    :CompoundStatement { $1 }

CompoundStatement:: {[Statement]}
    : 'begin' Statements 'end' { $2 }

Statements:: {[Statement]}
    : { [] } -- nothing; make empty list
    |Statement{ [$1] }
    |Statement ';' Statements { $1:$3 }-- put statement as first element of statements

Statement :: {Statement}
    : ID ':=' Exp { Assign $1 $3 }

    
Defs :: {[Definition]}
    : { [] } -- nothing; make empty list
    | Definition Defs { $1:$2 } -- put statement as first element of statements

Definition :: {Definition}
    : 'var' IdentiferList ':' Type { VarDef $2 $4 }  

Type :: {VType}
    : 'bool' { BOOL }
    | 'real' { REAL }
    | 'string' { STRING }



-- Expressions
Exp :: {Exp}
    : '+' Exp { $2 } -- ignore Plus
    | '-' Exp { Op1 "-" $2}
    | Exp '+' Exp { Op2 "+" $1 $3 }
    | Exp '*' Exp { Op2 "*" $1 $3 }
    | '(' Exp ')' { $2 } -- ignore brackets

BoolExp :: {BoolExp}
    : 'true' { True_C }
    | 'false' { False_C }
    | 'not' BoolExp { Not $2 }
    | BoolExp 'and' BoolExp { OpB "and" $1 $3 }
    | ID { Var_B $1 }

{}