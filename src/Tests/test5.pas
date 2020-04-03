program HelloWorld;
var
length : real;
width : real;
height : real;
Volume : real;

begin
    length := 7;
    width := 5;
    height := 3;
    Volume:=(length * (height * width))/3;

    
    writeln('The Volume of this Pyramid is ' , Volume);
    writeln('This is test5')
end.