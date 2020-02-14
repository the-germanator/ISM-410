*&---------------------------------------------------------------------*
*& Report ZCVS46_LAB_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcvs46_lab_3.

* First Name, Last Name & Color Input
PARAMETERS s1_fn(12) TYPE c.
PARAMETERS s1_ln(12) TYPE c.
PARAMETERS color(5) TYPE c.

* Set Color to negative input for errors
FORMAT COLOR COL_NEGATIVE INVERSE.

* Check for the following errors:
* a) No First AND Last name
* B) No First Name
* C) No Last Name
* D) Color not in [Red, Blue, Green, All]
* Show appropriate error for each case
IF s1_fn = '' AND s1_ln = ''.
  WRITE 'Please enter your First and Last name'.
ELSEIF s1_fn = ''.
  WRITE 'Please enter your first name'.
ELSEIF s1_ln = ''.
  WRITE 'Please enter your last name'.
ELSEIF color <> 'RED' AND color <> 'BLUE' AND color <> 'GREEN' AND color <> 'ALL'.
  WRITE 'Please enter RED, BLUE, GREEN, or ALL'.
ELSE.
* If there was no error, reset colors, since we're about to display names!
  FORMAT COLOR OFF RESET.

* Uses switch (for some reason called a case) to determine which color to apply
* In the case of 'ALL', I literally copied and pasted all previous code from the individual colors.
  CASE color.
    WHEN 'RED'.
      FORMAT COLOR COL_NEGATIVE.
      WRITE:/, s1_fn, s1_ln.
    WHEN 'BLUE'.
      FORMAT COLOR COL_HEADING.
      WRITE:/, s1_fn, s1_ln.
    WHEN 'GREEN'.
      FORMAT COLOR COL_POSITIVE.
      WRITE:/, s1_fn, s1_ln.
    WHEN 'ALL'.
      FORMAT COLOR COL_NEGATIVE.
      WRITE:/, s1_fn, s1_ln.
      FORMAT COLOR COL_HEADING.
      WRITE:/, s1_fn, s1_ln.
      FORMAT COLOR COL_POSITIVE.
      WRITE:/, s1_fn, s1_ln.
  ENDCASE.
ENDIF.
