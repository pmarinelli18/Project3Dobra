program whileLoopTest;
var
   a: real;

begin
   a := 0;
   while  a < 10  do
   begin
      writeln('this is i in while loop: ' ,a);
      a := a + 1
   end;
   writeln('checking whether the scope is correct if correct should be 0: ', a)
end.