



%let inpath= %str(/folders/myshortcuts/myfolder/);
%let infile = %str(Commerzbank Product-Search-3.xlsx);

libname indat "&inpath./data";

proc import datafile ="&inpath./&infile."
dbms=xlsx replace out = indat.disco1(keep=wkn cap bewertungstag brief geld);
run;

data disco;
  set indat.disco1;
  price = max (put (geld,best.),put(brief,best.));
run;  