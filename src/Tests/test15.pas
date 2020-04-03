program ForBreakTest; 
var
   a: real;

begin
   a := 10;
   for a := 15  to 20 do
      begin
         a := a + 1;
         if a > 17 then
          
         writeln('more than to 17: ', a)
         
         else
         writeln('less than or equal to 17: ', a)
         
      end;
      
      writeln('scope works if a is 10: ', a)
end.