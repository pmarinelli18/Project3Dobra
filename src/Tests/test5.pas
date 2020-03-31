program HelloWorld;
var
length : real;
weight : real;
height : real;
Volume : real;

begin
    writeln('Let build a pyramid');
    writeln('Please insert the length and weight');
    readln(length);
    readln(weight);
    writeln('Now insert the height ');
    readln(height);
    Volume:=(length * (height * weight))/3;

    
    writeln('The Volume of your Pyramid is ' + Volume);
    writeln('This is test5');
end.