# utl-magic-string-andrunning-r-python-and-unix-utilites-from-eg-linux-using-a-pipe
    %let pgm=utl-magic-string-and-running-r-python-and-unix-utilites-from-eg-linux-using-a-pipe;

    Magic string and running r python and unix utilites from eg linux using a pipes

    github
    https://tinyurl.com/mujbazey
    https://github.com/rogerjdeangelis/utl-magic-string-andrunning-r-python-and-unix-utilites-from-eg-linux-using-a-pipe

    Unchecked code and the drop downs need to updated from windows to linux

    as a side note

      You need access to the operating system fo moat of what is below

        1 You can drop down and run R and python inside or outside sas
        2 You can outperform the eg grid (run 32 parallel tasks - grid is usually limited to 12 or fewer jobs)
        3 Run some very useful os utilities

     CONTENTS

     1 unix utilities (see below)
         a list your processes and end any task, even EG tasks (if magic string does not work)
         b list and manage your files even not obvious EG files
         c zip and unzip files

     You have to visit these repos

     2 magic string (see github repos)
       https://github.com/rogerjdeangelis/utl-resetting-sas-using-the-magic-string
       https://github.com/rogerjdeangelis/utl-using-a-magic-string-to-recover-from-a-frozen-sas-session
     3 grid alternatives parallel processing (see repos below)

       https://github.com/rogerjdeangelis/utl-driving-all-your-cores-at-I00-percent-utilization-parallel-processing
       https://github.com/rogerjdeangelis/utl-multi-tasking-thirty-parallel-compute-and-eight-io-bound-tasks-using-systask
       https://github.com/rogerjdeangelis/utl-parallel-processing-cumulative-sums-based-on-dates-and-grouped-by-product
       https://github.com/rogerjdeangelis/utl-parallell-processing-a-rolling-moving-three-month-ninety-day-skewness-for-five-thousand-variable
       https://github.com/rogerjdeangelis/utl-partitioning-your-table-for-a-big-parallel-systask-sort
       https://github.com/rogerjdeangelis/utl-passing-parameters-to-programs-performing-a-parallel-sort-using-systask
       https://github.com/rogerjdeangelis/utl-simple-example-of-parallel-processing-in-r
       https://github.com/rogerjdeangelis/utl-summarize-by-group-within-a-date-range-parallel-processing-systask
       https://github.com/rogerjdeangelis/utl_parallell_processing_creating_8_subsets
       https://github.com/rogerjdeangelis/utl-code-generation-for-potentially-very-fast-parallel-processing
       https://github.com/rogerjdeangelis/utl-count-distinct-ids-by-month-in-a-two-hundred-million-dataset-parallel-tasks


     4 Scraping server screens and conveting image to text (see this repo)
       https://github.com/rogerjdeangelis/utl-scraping-server-screens-when-Copy-Print-PageSource-are-disabled-python-tesseract

     5 dropping down to other languages ) couple on end)

       macros  (latest)
       https://tinyurl.com/y9nfugth
       https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

       https://github.com/rogerjdeangelis/utl-sas-macro-utl-submit-py64-310-drop-down-to-python
       https://github.com/rogerjdeangelis/utl-sas-macro-utl-submit-r64-drop-down-to-r
       https://github.com/rogerjdeangelis/utl-runing-a-python-function-inside-your-drop-down-to-r
       https://github.com/rogerjdeangelis/utl-examples-of-drop-downs-from-sas-to-wps-r-microsoftR-python-perl-powershell
       https://github.com/rogerjdeangelis/utl-four-ways-to-drop-down-from-sas-to-python-and-r

    /*               _              _   _ _ _ _   _
    / |  _   _ _ __ (_)_  __  _   _| |_(_) (_) |_(_) ___  ___
    | | | | | | `_ \| \ \/ / | | | | __| | | | __| |/ _ \/ __|
    | | | |_| | | | | |>  <  | |_| | |_| | | | |_| |  __/\__ \
    |_|  \__,_|_| |_|_/_/\_\  \__,_|\__|_|_|_|\__|_|\___||___/
               _ _       _          _ _
      ___ __ _| | |  ___| |__   ___| | |
     / __/ _` | | | / __| `_ \ / _ \ | |
    | (_| (_| | | | \__ \ | | |  __/ | |
     \___\__,_|_|_| |___/_| |_|\___|_|_|

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



    * LIST FILES;
    %unx(ls -l /sas/warehouse/users/{user]/files/sd1 );



    * LIST ALL FILES WITH STRING BEN CORRESPONDING TO LIBNAME BENE;

    %unx(ls -l %sysfunc(pathname(bene)) | grep bene);

    drwxrws---  2 xxx250   sas_xxx   108 Nov 21 12:31 bene_ambulance.sas7bdat
    drwxrws--- 25 xxx250   sas_xxx  1516 Apr  6 15:00 edu_bene_edducational.sas7bdat
    drwxrws---  2 xxx250   sas_xxx     0 Sep 11  2014 ehr_electronic_health_record_bene.sas7bdat



    * AVAILBLE SPACE IN SAS WORK DIRECTORY;

    %unx(df -k %sysfunc(pathaname(work)));



    * WORKS WITH WINDOWS;
    %unx(dir /b /a d:\pdf);



    * LIST MY PROCESSES(TASKS) INCLUDING WG SESSIONS;
    %unx(ps -ef | grep usr250);

    * END A PROCESS PROBLEMSONE TASK - MAY REQUIRE AN ADDTIONAL EG SESSION;
    %unx(kill -9 22849)



    * LIST ALL SAS BATCH JOBS;
    %unx(ps -ef | grep sysin);


    * run a batch job;
    * YOU HAVE TO WRAP YOUR CODE IN A MACRO AND THE MACRO HAS TO BE IN YOUR AUTOCALL LIBRARY;
    * MORE FLEXIBLE WAY TO PASS ARGUMENTS TO A BATCH JOB;
    * SEE https://github.com/rogerjdeangelis/utl_parallell_processing_creating_8_subsets;

    %let _s=%sysget(SASROOT).\sas.exe -sysin &r/nul -sasautos &r/oto -autoexec &r/oto/oto.sas -work &r/wrk
    %unx(&_s -termstmt %nrstr(%his_100drv(modres=3);) -altlog &_h/LOG/his_100drv0.log);


    * ZIP A FILE;

    %unx(gzip -1c &_r/log/dummy2.log > &_r/log/dummyz.log.gz );

    *UNZIP A FILE;

    %unx(gunzip d/log/dummy2.log.gz);

    /*___                             _            _                     _
    | ___|  ___  __ _ _ __ ___  _ __ | | ___    __| |_ __ ___  _ __   __| | _____      ___ __  ___
    |___ \ / __|/ _` | `_ ` _ \| `_ \| |/ _ \  / _` | `__/ _ \| `_ \ / _` |/ _ \ \ /\ / / `_ \/ __|
     ___) |\__ \ (_| | | | | | | |_) | |  __/ | (_| | | | (_) | |_) | (_| | (_) \ V  V /| | | \__ \
    |____/ |___/\__,_|_| |_| |_| .__/|_|\___|  \__,_|_|  \___/| .__/ \__,_|\___/ \_/\_/ |_| |_|___/
                 _   _         |_|                            |_|
     _ __  _   _| |_| |__   ___  _ __
    | `_ \| | | | __| `_ \ / _ \| `_ \
    | |_) | |_| | |_| | | | (_) | | | |
    | .__/ \__, |\__|_| |_|\___/|_| |_|
    |_|    |___/
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

    /*
     _ __
    | `__|
    | |
    |_|

    */
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

