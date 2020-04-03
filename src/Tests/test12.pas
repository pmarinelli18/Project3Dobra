program fibonacciTest;
var
    a: real;

function fibonacci(n: real ) : real;
begin
	if n > 1 then
	begin
        
		fibonacci := fibonacci(n - 2) + fibonacci(n - 1)
        
	end
	else
	begin
		fibonacci := n
	end
end
;

begin
 writeln('This is fibonacci of 11');
    a:= fibonacci(11);
    writeln(a);
	writeln('This is fibonacci of 4');
    a:= fibonacci(4);
    writeln(a);
	writeln('This is fibonacci of 7');
    a:= fibonacci(7);
    writeln(a)
end.