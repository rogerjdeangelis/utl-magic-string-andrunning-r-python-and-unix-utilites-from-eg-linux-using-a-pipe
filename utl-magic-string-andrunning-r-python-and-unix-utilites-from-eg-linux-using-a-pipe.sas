%let pgm=utl-magic-string-andrunning-r-python-and-unix-utilites-from-eg-linux-using-a-pipe;

Magic string andrunning r python and unix utilites from eg linux using a pipe

Unchecked code and the drop downs need to updated from windows to linux

github
https://github.com/rogerjdeangelis/utl-magic-string-andrunning-r-python-and-unix-utilites-from-eg-linux-using-a-pipe 


Related repos
https://github.com/rogerjdeangelis/utl-resetting-sas-using-the-magic-string
https://github.com/rogerjdeangelis/utl-using-a-magic-string-to-recover-from-a-frozen-sas-session

https://github.com/rogerjdeangelis/utl-code-generation-for-potentially-very-fast-parallel-processing
https://github.com/rogerjdeangelis/utl-count-distinct-ids-by-month-in-a-two-hundred-million-dataset-parallel-tasks
https://github.com/rogerjdeangelis/utl-driving-all-your-cores-at-I00-percent-utilization-parallel-processing
https://github.com/rogerjdeangelis/utl-multi-tasking-thirty-parallel-compute-and-eight-io-bound-tasks-using-systask
https://github.com/rogerjdeangelis/utl-parallel-processing-cumulative-sums-based-on-dates-and-grouped-by-product
https://github.com/rogerjdeangelis/utl-parallell-processing-a-rolling-moving-three-month-ninety-day-skewness-for-five-thousand-variable
https://github.com/rogerjdeangelis/utl-partitioning-your-table-for-a-big-parallel-systask-sort
https://github.com/rogerjdeangelis/utl-passing-parameters-to-programs-performing-a-parallel-sort-using-systask
https://github.com/rogerjdeangelis/utl-simple-example-of-parallel-processing-in-r
https://github.com/rogerjdeangelis/utl-summarize-by-group-within-a-date-range-parallel-processing-systask
https://github.com/rogerjdeangelis/utl_parallell_processing_creating_8_subsets

https://github.com/rogerjdeangelis/utl-sas-macro-utl-submit-py64-310-drop-down-to-python
https://github.com/rogerjdeangelis/utl-sas-macro-utl-submit-r64-drop-down-to-r
https://github.com/rogerjdeangelis/utl-runing-a-python-function-inside-your-drop-down-to-r
https://github.com/rogerjdeangelis/utl-examples-of-drop-downs-from-sas-to-wps-r-microsoftR-python-perl-powershell
https://github.com/rogerjdeangelis/utl-four-ways-to-drop-down-from-sas-to-python-and-r

/*           _              _   _ _ _ _   _
 _   _ _ __ (_)_  __  _   _| |_(_) (_) |_(_) ___  ___
| | | | `_ \| \ \/ / | | | | __| | | | __| |/ _ \/ __|
| |_| | | | | |>  <  | |_| | |_| | | | |_| |  __/\__ \
 \__,_|_| |_|_/_/\_\  \__,_|\__|_|_|_|\__|_|\___||___/

*/

%macro unx(unxcmd)/
  des="Executing Unix commands in EG even when XCMD is turned off";
  * this works on some EG complexes;
  * sample invocations;
  /*
     %unx(ls -l &myfiles_root);
     %unx(ls -l &myfiles_root | grep unx);
  */
  filename xeq pipe "&unxcmd";
  data _null_;
    infile xeq;
    input;
    putlog _infile_;
  run;quit;

%mend unx;

%unx(ls -l /sas/warehouse/users/{user]/files/sd1 );

for libname bene list all files containing string
%unx(ls -l %sysfunc(pathname(bene)) | grep bene);

drwxrws---  2 xxx250   sas_xxx   108 Nov 21 12:31 amb_ambulance.sas7bdat
drwxrws--- 25 xxx250   sas_xxx  1516 Apr  6 15:00 edu_edducational.sas7bdat
drwxrws---  2 xxx250   sas_xxx     0 Sep 11  2014 ehr_electronic_health_record.sas7bdat

* windows;
%unx(dir /b /a d:\pdf);

* Usefull utilities;

* list my processes(tasks) including eg session;
* this will give you the process numbers;
%unx(ps -ef | grep rde250);

* end a process;
%unx(kill -9 22849)

* list all sas batch jobs;
%unx(ps -ef | grep sysin);

* &s is the sas executable
*run a sas macro linux batch job batch macro has to be in autocall library;;
%unx(&_s -termstmt %nrstr(%his_100drv(modres=3);) -altlog &_h/LOG/his_100drv0.log);

* zip a file;
%unx(gzip -1c &_r/log/dummy2.log > &_r/log/dummyz.log.gz );

*unzip
%unx(gunzip d/log/dummy2.log.gz);

/*   _                       _
  __| |_ __ ___  _ __     __| | _____      ___ __  ___
 / _` | `__/ _ \| `_ \   / _` |/ _ \ \ /\ / / `_ \/ __|
| (_| | | | (_) | |_) | | (_| | (_) \ V  V /| | | \__ \
 \__,_|_|  \___/| .__/   \__,_|\___/ \_/\_/ |_| |_|___/
                |_|
*/
%macro utl_pybeginx;
  %utlfkil(c:/temp/py_pgm.py);
  %utlfkil(c:/temp/py_pgm.pyx);
  %utlfkil(c:/temp/py_pgm.log);
  filename ft15f001 "c:/temp/py_pgm.pyx";
%mend utl_pybeginx;
%macro utl_pyend;
run;quit;
* EXECUTE THE PYTHON PROGRAM;
options noxwait noxsync;
filename rut pipe  "d:\Python310\python.exe c:/temp/py_pgm.py 2> c:/temp/py_pgm.log";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/py_pgm.log";
  input;
  putlog _infile_;
run;quit;
filename ft15f001 clear;
%mend utl_pyend;

%macro utl_rbeginx/des="utl_rbeginx uses parmcards and must end with utl_rendx macro";
%utlfkil(c:/temp/r_pgmx);
%utlfkil(c:/temp/r_pgm);
filename ft15f001 "c:/temp/r_pgm";
%mend utl_rbeginx;

%macro utl_rendx(return=)/des="utl_rbeginx uses parmcards and must end with utl_rendx macro";
run;quit;
* EXECUTE R PROGRAM;
data _null_;
  infile "c:/temp/r_pgm";
  input;
  file "c:/temp/r_pgmx";
  lyn=resolve(_infile_);
  put lyn;
run;quit;
options noxwait noxsync;
filename rut pipe "D:\r414\bin\r.exe --vanilla --quiet --no-save < c:/temp/r_pgmx";
run;quit;
data _null_;
  file print;
  infile rut;
  input;
  put _infile_;
  putlog _infile_;
run;quit;
data _null_;
  infile " c:/temp/r_pgm";
  input;
  putlog _infile_;
run;quit;
%if "&return" ne ""  %then %do;
  filename clp clipbrd ;
  data _null_;
   infile clp obs=1;
   input;
   putlog "xxxxxx  " _infile_;
   call symputx("&return.",_infile_,"G");
  run;quit;
  %end;
filename ft15f001 clear;
%mend utl_rendx;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
