program whileContinueTest; 
var
   b : real;
a : real;

begin
    b := 15;
    a := 10;
   (* repeat until loop execution *)
   while  a < 20  do
   begin
        a := a + 1;
        if  b>a then writeln('True') else
        continue;
        writeln('Doing the rest of the while loop');
   end;
      writeln(a);
end.

