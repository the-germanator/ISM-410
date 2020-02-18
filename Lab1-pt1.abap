*&---------------------------------------------------------------------*
*& Report ZCVS46_LAB_1_PART1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCVS46_LAB_1_PART1.

****************************** PARAMETERS ******************************
PARAMETERS par_yr1 TYPE P.
PARAMETERS par_yr2 TYPE P.
PARAMETERS par_yr3 TYPE P.
PARAMETERS par_yr4 TYPE P.
PARAMETERS par_yr5 TYPE P.
PARAMETERS par_yr6 TYPE P.

****************************** DATA ******************************

* Holds the total # of students
DATA par_yr_total TYPE P.
COMPUTE par_yr_total = par_yr1 + par_yr2 + par_yr3 + par_yr4 + par_yr5 + par_yr6.

* Calculate percentage of whole for each year (re-used for each one)
DATA par_yr_percentage TYPE P DECIMALS 2.

****************************** Display Report ******************************

* Show Report header
WRITE: sy-datum, 35 'Student Enrollment Report'.
ULINE.

* Display the total and percentage of students in year
COMPUTE par_yr_percentage = ( par_yr1 / par_yr_total ) * 100.
WRITE:/ 'Students in year 1:  ', par_yr1, '  ', par_yr_percentage,'%'.
SKIP.

* Display the total and percentage of students in year
COMPUTE par_yr_percentage = ( par_yr2 / par_yr_total ) * 100.
WRITE:/ 'Students in year 2:  ', par_yr2, '  ', par_yr_percentage,'%'.
SKIP.

* Display the total and percentage of students in year
COMPUTE par_yr_percentage = ( par_yr3 / par_yr_total ) * 100.
WRITE:/ 'Students in year 3:  ', par_yr3, '  ', par_yr_percentage,'%'.
SKIP.

* Display the total and percentage of students in year
COMPUTE par_yr_percentage = ( par_yr4 / par_yr_total ) * 100.
WRITE:/ 'Students in year 4:  ', par_yr4, '  ', par_yr_percentage,'%'.
SKIP.

* Display the total and percentage of students in year
COMPUTE par_yr_percentage = ( par_yr5 / par_yr_total ) * 100.
WRITE:/ 'Students in year 5:  ', par_yr5, '  ', par_yr_percentage,'%'.
SKIP.

* Display the total and percentage of students in year
COMPUTE par_yr_percentage = ( par_yr6 / par_yr_total ) * 100.
WRITE:/ 'Students in year 6:  ', par_yr6, '  ', par_yr_percentage,'%'.
SKIP.

* Display Summary Information
WRITE:/ 'Total Number of Students:    ', par_yr_total.
