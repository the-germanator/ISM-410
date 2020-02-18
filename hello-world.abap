*&---------------------------------------------------------------------*
*& Report ZCVS46_FIRST_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcvs46_first_program.

* WRITE'Hello, World'.

** PARAMS **
PARAMETERS p_num1(2) TYPE p.
PARAMETERS p_num2(2) TYPE p.

** VARIABLES **
DATA v_result(3) TYPE p.

** CALCULATION **
COMPUTE v_result = p_num1 + p_num2.

** OUTPUT **
WRITE:/'First Number: ',p_num1,/'Second Number: ',p_num2,/'Result: ',v_result.
