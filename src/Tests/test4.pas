program HelloWorld;
var
alta : real;
BaT : real;
Drag : real;
(*There is a cooment here*)
connecr : boolean;

begin
    writeln('This is the value of BaT ');
    writeln(BaT);
    writeln('This is the value of alta ');
    writeln(alta);
    alta:=ln(1) + 3;
    (*There is a cooment here*)
    BaT:=cos(0);
    writeln('This is the value of BaT ');
    writeln(BaT);
    writeln('This is the value of alta ');
    writeln(alta);
    (*There is a cooment here*)
    Drag := BaT - alta;
    writeln('This is the value of alta ');
    writeln(Drag);
    Drag := dopower(2, 2); 
    writeln('This is the final result of Drag ');
    writeln(Drag);
    writeln('This is test4');
end.