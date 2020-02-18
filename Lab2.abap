*&---------------------------------------------------------------------*
*& Report ZCVS46_LAB2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCVS46_LAB2.

* Holds the computed average of grades
DATA avg_computed TYPE p.

*** Student Data
** Student 1 Data

* First & Last Names
PARAMETERS s1_fn(12) TYPE C.
PARAMETERS s1_ln(12) TYPE C.

* Grade Data
PARAMETERS s1_g1(3)  TYPE p.
PARAMETERS s1_g2(3) TYPE p.
PARAMETERS s1_g3(3) TYPE p.
PARAMETERS s1_g4(3) TYPE p.
PARAMETERS s1_g5(3) TYPE p.

** Student 2 Data

* First & Last Names
PARAMETERS s2_fn(12) TYPE C.
PARAMETERS s2_ln(12) TYPE C.

* Grade Data
PARAMETERS s2_g1(3)  TYPE p.
PARAMETERS s2_g2(3) TYPE p.
PARAMETERS s2_g3(3) TYPE p.
PARAMETERS s2_g4(3) TYPE p.
PARAMETERS s2_g5(3) TYPE p.

*** Display Section

* Display Header line
WRITE 'Grade Book'.
SKIP.
FORMAT COLOR COL_NEGATIVE INTENSIFIED OFF.
WRITE:(5) ' ',(20) 'Student Name',(8) 'Score1',(8) 'Score2',(8) 'Score3',(8) 'Score4',(8) 'Score5',(8) 'Grade %'.
ULINE.
SKIP.

* Perform grade average calculation for Student 1
COMPUTE avg_computed = ( s1_g1 * '0.20' ) + ( s1_g2 * '0.20' ) + ( s1_g3 * '0.25' ) + ( s1_g4 * '0.25' ) + ( s1_g5 * '0.1' ).

* Show Students in black font with blue background
FORMAT COLOR COL_HEADING INTENSIFIED.

* Print student's name
WRITE: (10) s1_fn, (10) s1_ln.

* Reset Color
FORMAT COLOR OFF.

* Display grades in row
WRITE: (2) '', (8) s1_g1, (8) s1_g2, (8) s1_g3, (8) s1_g4, (6) s1_g5, (4) ' '.

* Switch font style to black on yellow/green
FORMAT COLOR COL_POSITIVE.

* Display computed average grade
WRITE: (5) avg_computed.

* Add new line & formatting
SKIP.
ULINE.
SKIP.

* Perform grade average calculation for Student 1
COMPUTE avg_computed = ( s2_g1 * '0.20' ) + ( s2_g2 * '0.20' ) + ( s2_g3 * '0.25' ) + ( s2_g4 * '0.25' ) + ( s2_g5 * '0.1' ).

* Show Students in black font with blue background
FORMAT COLOR COL_HEADING INTENSIFIED.

* Print student's name
WRITE: (10) s2_fn, (10) s2_ln.

* Reset Color
FORMAT COLOR OFF.

* Display grades in row
WRITE: (2) '', (8) s2_g1, (8) s2_g2, (8) s2_g3, (8) s2_g4, (6) s2_g5, (4) ' '.

* Switch font style to black on yellow/green
FORMAT COLOR COL_POSITIVE.

* Display computed average grade
WRITE: (5) avg_computed.

* Add new line & formatting
SKIP.
ULINE.
