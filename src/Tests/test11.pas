program exLocal;
var
   a: real; 
   b: real;
   c: real;
procedure display();
var
   a: real; 
   b: real;
   c: real;
begin
   (*local variables *)
   a :=10;
   b :=20;
   c := a + b;
   writeln('Winthin the procedure display');
   writeln('value of a = ', a ,' b =  ',  b,' and c = ', c);
end;
begin
   a:=100;
   writeln(a);
   b:=200;
   writeln(b);
   c:= a + b;
   writeln('Winthin the program exlocal');
   writeln('value of a = ', a ,' b =  ',  b,' and c = ', c);
   display();
end.