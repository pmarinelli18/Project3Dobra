program fibonacciTest;
var
    a: real;

procedure multiplyByThree(a: real );
begin
   writeln(a * 3)
end;
begin
   writeln('before 3 multiply by three');
   multiplyByThree(3);
   writeln('before 5 multiply by three');
   multiplyByThree(5);
   writeln('before 8 multiply by three');
   multiplyByThree(8)
end.