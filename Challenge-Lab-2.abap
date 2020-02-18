*&---------------------------------------------------------------------*
*& Report ZCVS46_CHALLENGE_LAB2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCVS46_CHALLENGE_LAB2.
PARAMETERS par_num1(2) TYPE p.
PARAMETERS par_num2(2) TYPE p.
PARAMETERS par_code(1) TYPE c.

CONSTANTS con_error(75) TYPE c VALUE 'Error: Please enter A to Add, S to Subtract, M to Multiply, or D to Divide'.
CONSTANTS con_num1(12) TYPE c VALUE 'Number One: '.
CONSTANTS con_num2(12) TYPE c VALUE 'Number Two: '.
CONSTANTS con_result(8) TYPE c VALUE 'Result: '.



DATA calc_result(6) TYPE p DECIMALS 2.

IF par_code = 'A'.
COMPUTE calc_result = par_num1 + par_num2.
FORMAT COLOR 1.
WRITE 'You have chosen to ADD'.
WRITE: /, con_num1, par_num1.
WRITE: /, con_num2, par_num2.
WRITE: /, con_result, calc_result.
ELSEIF par_code = 'S'.
COMPUTE calc_result = par_num1 - par_num2.
FORMAT COLOR 7.
WRITE 'You have chosen to SUBTRACT'.
WRITE: /, con_num1, par_num1.
WRITE: /, con_num2, par_num2.
WRITE: /, con_result, calc_result.
ELSEIF par_code = 'M'.
COMPUTE calc_result = par_num1 * par_num2.
FORMAT COLOR 3.
WRITE 'You have chosen to MULTIPLY'.
WRITE: /, con_num1, par_num1.
WRITE: /, con_num2, par_num2.
WRITE: /, con_result, calc_result.
ELSEIF par_code = 'D'.
COMPUTE calc_result = par_num1 / par_num2.
FORMAT COLOR 5.
WRITE 'You have chosen to DIVIDE'.
WRITE: /, con_num1, par_num1.
WRITE: /, con_num2, par_num2.
WRITE: /, con_result, calc_result.
ELSE.
FORMAT COLOR 6 INVERSE.
WRITE / con_error.
ENDIF.
FORMAT COLOR OFF INVERSE OFF.
