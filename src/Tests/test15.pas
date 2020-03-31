program ForBreakTest; 
var
   a: real;

begin
   a := 10;
   for a := 15  to 20 do
      begin
         a := a + 1;
         if a > 17 then
         break
         else
         writeln('less than', a);
         writeln('didnt break');
      end;
      
      writeln('value of a: ', a);
      a := a+1;
end.