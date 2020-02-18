*&---------------------------------------------------------------------*
*& Report ZCVS46_LAB_1_PART2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcvs46_lab_1_part2.

****************************** PARAMETERS ******************************
PARAMETERS par_cona TYPE P DECIMALS 0.
PARAMETERS par_conb TYPE P DECIMALS 0.
PARAMETERS par_conc TYPE P DECIMALS 0.
PARAMETERS par_cond TYPE P DECIMALS 0.
PARAMETERS par_cone TYPE P DECIMALS 0.

****************************** DATA ******************************

* Percentage of workweek. Variable is re-used for each consultant
DATA par_percentage TYPE P DECIMALS 2.

* Hours in the woekweek. Stays constant
DATA par_workweek TYPE P DECIMALS 1 VALUE '37.5'.

* Number of cosultants. Stays constant
DATA par_num_consultants TYPE I VALUE '5'.

*  Holds the total # of hours
DATA par_total TYPE I.

* Calculate total # of hours worked by summing all consultants' hours
COMPUTE par_total = par_cona + par_conb + par_conc + par_cond + par_cone.

* Holds the overall average # of hours across all consultants
DATA par_avg TYPE P DECIMALS 2.
* Calculate average # of hours worked by dividing the
* previously calculated total by the # of consultants
COMPUTE par_avg = ( par_total / par_num_consultants ).

****************************** Write to Screen ******************************

* Write Header
WRITE: sy-datum, 50 'Consultant Report'.
ULINE.

* Calculate and display the percentage of hours compared to standard workweek
COMPUTE par_percentage = ( par_cona /  par_workweek ) * 100.
WRITE: 'Hours for Consultant A:', par_cona, par_percentage,'%'.
SKIP.

* Calculate and display the percentage of hours compared to standard workweek
COMPUTE par_percentage = ( par_conb / par_workweek ) * 100.
WRITE: 'Hours for Consultant B:', par_conb, par_percentage,'%'.
SKIP.

* Calculate and display the percentage of hours compared to standard workweek
COMPUTE par_percentage = ( par_conc / par_workweek ) * 100.
WRITE: 'Hours for Consultant C:', par_conc, par_percentage,'%'.
SKIP.

* Calculate and display the percentage of hours compared to standard workweek
COMPUTE par_percentage = ( par_cond / par_workweek ) * 100.
WRITE: 'Hours for Consultant D:', par_cond, par_percentage,'%'.
SKIP.

* Calculate and display the percentage of hours compared to standard workweek
COMPUTE par_percentage = ( par_cone / par_workweek ) * 100.
WRITE: 'Hours for Consultant E:', par_cone, par_percentage,'%'.
SKIP.


* Display summary information
WRITE: 'Total Number of Hours Worked: ', par_total.
SKIP.
WRITE:/ 'Average Number of Hours Worked: ', par_avg.
