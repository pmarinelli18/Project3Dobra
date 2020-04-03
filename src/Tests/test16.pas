program whileContinueTest; 
var
a : real;

begin
    a := 10;
    while a <100 do
        begin
            writeln(a, '  ');
            a := a + a
        end;
      writeln(a)
end.
