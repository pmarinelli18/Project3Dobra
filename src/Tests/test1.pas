program HelloWorld;

var
    alta : real;
    BaT : real;
    connecr : boolean;
    sum : real;
    number : real;

begin
    sum:= 10;
    number:=10;
    while number > 4 do
    begin
        sum := sum + number;
        number := number - 2;
        writeln(number)
    end;
    alta:=212-3;
    writeln(alta);
    BaT:=55+66;
    writeln(BaT);
    writeln('This is test1')
end.