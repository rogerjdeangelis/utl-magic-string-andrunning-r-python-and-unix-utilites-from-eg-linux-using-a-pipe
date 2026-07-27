/*
  Magic-string technique, from the utl_rendx macro in
  utl-magic-string-andrunning-r-python-and-unix-utilites-from-eg-linux-using-a-pipe.sas.

  utl_rendx turns a template program (r_pgm) into an executable one (r_pgmx)
  by reading it line by line and resolving the (&) macro references in place:

      data _null_;
        infile "c:/temp/r_pgm";
        input;
        file "c:/temp/r_pgmx";
        lyn = resolve(_infile_);   <- the "magic string": expand &macrovars per line
        put lyn;
      run;quit;

  This bundle exercises that exact mechanism with an inline template so the
  run is self-contained: each line's &-references are resolved into the
  assembled program (here collected and printed instead of piped to R/Python).
*/

%let n      = 5;
%let label  = magic;
%let dsn    = class;

data rpgm;
  length line $256;
  infile datalines;
  input;
  line = resolve(_infile_);   /* the "magic string": expand &macrovars per line */
datalines4;
-- R program assembled by the SAS magic-string technique
x      <- seq_len(&n)
label  <- "&label"
dataset<- "sashelp.&dsn"
values <- rep(label, &n)
mean_x <- mean(seq_len(&n))
;;;;
run;

proc print data=rpgm noobs;
  var line;
run;quit;
