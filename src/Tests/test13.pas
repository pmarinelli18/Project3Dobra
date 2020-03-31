program whileLoopTest;
var
   a: real;
   i: real;

begin
   a := 10;
   while  a < 20  do
   begin
      i:= 1+i;
      writeln('this is i in while loop: ' ,i);
      a := a + 1;
   end;
   writeln('checking whether the scope is correct, if correct should be 0: ', i);
end.