program fibonacciTest;
var
    a: real;

function fibonacci(n: real): real;
begin
    
	if n > 1 then
	begin
		fibonacci := fibonacci(n - 2) + fibonacci(n - 1);
        
    break;
	end
	else
	begin
		fibonacci := n
	end
end
;

begin
 writeln('hi');
    a:= fibonacci(8);
    writeln('fibonacci 8',a);
        a:= fibonacci(3);
    writeln('fibonacci3',a);
        a:= fibonacci(5);
    writeln('fibonacci5',a);
        a:= fibonacci(10);
    writeln('fibonacci10',a);
        a:= fibonacci(2);
    writeln('fibonacci2',a);
        a:= fibonacci(1);
    writeln('fibonacci1',a)
end.