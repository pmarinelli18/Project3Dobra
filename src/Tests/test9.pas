program GoodByeWorld;
var
alta : real;
(*There is a cooment here*)
BaT : real;
(*There is a cooment here*)
connecr : boolean;

begin
    
    writeln('My answer is true');
    writeln('What is your answer');
    readln(connecr);
    writeln('Your answer is ' + connecr);
    writeln('My debt is equal to _99');
    writeln('How mmuch would you decrease it?');
    BaT:= 99;
    readln(alta);
    BaT:=BaT-alta;
    writeln('My debt now is ' + BaT);
    
    
    writeln('This is test9');
end.