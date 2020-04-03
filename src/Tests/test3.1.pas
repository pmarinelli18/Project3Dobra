program checkCase;
var
   grade: real;
begin
   grade := 4;

   case (grade) of
      1 : writeln('Excellent' );
      2 : writeln('Well done' );
      3 : writeln('You passed' );
      4 : writeln('Better try again' )
    end;
   writeln('Your grade is  ', grade )
end.