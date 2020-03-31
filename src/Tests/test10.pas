program Machupihu;
var
alta : real;
(*There is a cooment here*)
BaT : real;
(*There is a cooment here*)
connecr : boolean;

begin
    writeln('Select a number');
    readln(BaT);
    
    writeln('Reduce the number to zero in three tries');
    writeln('Select either true or false');
    readln(connecr);
    if(connecr)
    then BaT:=BaT*9
    else BaT:=BaT+8;

    writeln('Reduce the number to zero in two tries');
    writeln('Select either true or false');
    readln(connecr);
    if(connecr)
    then BaT:=BaT*19
    else BaT:=BaT-88;

    writeln('Last try tries');
    writeln('Select either true or false');
    readln(connecr);
    if(connecr)
    then BaT:=1
    else BaT:=0;
    
    if(BaT)
    then
    writeln('You are right')
    else
    writeln('You fail');
    
    
    writeln('This is test10');
end.