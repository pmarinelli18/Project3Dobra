program HelloWorld;
var
BaT : real;
count:real;
decision : boolean;
answer : boolean;


begin
    writeln('the number is equal to _5');
    writeln('Is the number equal to _5');
    writeln('True or False');
    readln(decision);
    answer := true;
    if(decision=answer) then
        count:= count + 1
    else
        count:= count - 1;

    writeln('multiply by _5');
    writeln('Is the number equal to _35');
    writeln('True or False');
    readln(decision);
    answer := false;
    if(decision=answer) then
        count:=count+1
    else
        count:=count-1;
    
    writeln('divide by _25');
    writeln('Is the number equal to _5');
    writeln('True or False');
    readln(decision);
    answer := false;
    if(decision=answer) then
        count:=count+1
    else
        count:=count-1;
    
    writeln('logarithm of answer');
    writeln('Is the number equal to _1');
    writeln('True or False');
    readln(decision);
    answer := false;
    if(decision=answer) then
        count:=count+1
    else
        count:=count-1;

    writeln('Your score is ' + count);
    writeln('This is test7');
end.