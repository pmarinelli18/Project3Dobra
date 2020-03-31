program checkCase;
var
   grade: real;
begin
   grade := 4.0;

   case (grade) of
      1.0 : writeln('Excellent!' );
      2.0 : writeln('Well done' );
      3.0 : writeln('You passed' );
      4.0 : writeln('Better try again' )
    end;
   writeln('Your grade is  '+ grade );
end.