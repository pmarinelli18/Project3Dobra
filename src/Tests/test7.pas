program HelloWorld;
var
BaT : real;
count:real;
decision : bool;
answer : bool;


begin

    writeln('the number is equal to 5');
    writeln('Is the number equal to 5');
    writeln('True or False');
    answer := true;

    if 6 > 6 then
        count:= count + 1
    else
        count:= count - 1;

    writeln('multiply by 5');
    writeln('Is the number equal to 35');
    writeln('True or False');
    answer := false;
    
    if decision = answer then
        count:=count+1
    else
        count:=count-1;
    
    writeln('divide by 25');
    writeln('Is the number equal to 5');
    writeln('True or False');
    answer := false;

    if decision=answer then
        count:=count+1
    else
        count:=count-1;
    
    writeln('logarithm of answer');
    writeln('Is the number equal to 1');
    writeln('True or False');
    answer := false;

    if decision=answer then
        count:=count+1
    else
        count:=count-1;

    writeln('Your score is ' , count);
    writeln('This is test7')
end.