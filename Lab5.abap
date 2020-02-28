*&---------------------------------------------------------------------*
*& Report ZCVS46_LAB_5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcvs46_lab_5.

* Input parameters
PARAMETERS code(2) TYPE c.
PARAMETERS orig(12) TYPE c.
PARAMETERS dest(12) TYPE c.

* Pre-defined header for table
CONSTANTS con_header(92) TYPE c VALUE
'  Airline    Connection    From         To            Flight Time  Departure   Arrival'.

* Pre-defined error messages
CONSTANTS no_code(50) TYPE c VALUE 'Invalid Airline Code'.
CONSTANTS no_orig(33) TYPE c VALUE 'No airlines currently fly from: '.
CONSTANTS no_dest(31) TYPE c VALUE 'No airlines currently fly to: '.
CONSTANTS no_match(45) TYPE c VALUE 'Sorry, no flights match your selections'.

* temp data used to check if inputs are valid
DATA _with_dest TYPE p.
DATA _with_orig TYPE p.
DATA _with_code TYPE p.

* Stores number of records (flights) found
DATA number_of_records TYPE p.

* Struct for internal database
TYPES: BEGIN OF flight_rec,
         _carrid  LIKE spfli-carrid,
         _conn    LIKE spfli-connid,
         _from    LIKE spfli-cityfrom,
         _to      LIKE spfli-cityto,
         _flytime LIKE spfli-fltime,
         _dept    LIKE spfli-deptime,
         _arr     LIKE spfli-arrtime,
       END OF flight_rec.

* Transfers external data to internal table
DATA: int_flight_rec TYPE STANDARD TABLE OF flight_rec,
      _record        TYPE flight_rec.

* Check if user's inputs are valid by first running against the external table
SELECT COUNT(*) FROM spfli INTO _with_code
        WHERE carrid = code.

SELECT COUNT(*) FROM spfli INTO _with_orig
        WHERE cityfrom = orig.

SELECT COUNT(*) FROM spfli INTO _with_dest
        WHERE cityto = dest.

* In order, check each error condition and display appropriate message
FORMAT COLOR 6 INVERSE.
IF _with_code = 0.
  WRITE no_code.
ELSEIF _with_orig = 0.
  WRITE:/ no_orig, orig.
ELSEIF _with_dest = 0.
  WRITE:/ no_dest, dest.
ELSE.
* No initial errors found (just means that each piece of data exists SEPERATELY) in database.
  FORMAT COLOR OFF INVERSE OFF.

*** Extract data from expernal to internal table. Use query to accomplish this based on what data was entered.
* * Test if origin is empty
  IF orig = ''.
*   * Test if destination is also empty
*   * Both are empty. Only check by carrier ID
    IF dest = ''.
      SELECT carrid connid cityfrom cityto fltime deptime arrtime
         FROM spfli INTO TABLE int_flight_rec
         WHERE carrid = code.
*   * No origin was given, but destination was.
    ELSE.
      SELECT carrid connid cityfrom cityto fltime deptime arrtime
         FROM spfli INTO TABLE int_flight_rec
         WHERE carrid = code AND cityto = dest.
    ENDIF.
* * Origin was NOT empty
  ELSE.
*   * Origin is not empty, but destination is
    IF dest = ''.
      SELECT carrid connid cityfrom cityto fltime deptime arrtime
         FROM spfli INTO TABLE int_flight_rec
         WHERE carrid = code AND cityfrom = orig.
    ELSE.
*     * Neither one is empty (most specific)
      SELECT carrid connid cityfrom cityto fltime deptime arrtime
     FROM spfli INTO TABLE int_flight_rec
     WHERE carrid = code AND cityfrom = orig AND cityto = dest.
    ENDIF.
  ENDIF.

* Check if there are matches. If so, number is used later for display
  LOOP AT int_flight_rec INTO _record WHERE _carrid = code.
    ADD 1 TO number_of_records.
  ENDLOOP.

* If no matches, show error and nothing else.
  IF number_of_records = 0.
    FORMAT COLOR 6 INVERSE.
    WRITE:/ no_match.
    FORMAT COLOR OFF INVERSE OFF.
* * Results were found
  ELSE.
*   * Display header
    FORMAT COLOR COL_HEADING.
    WRITE con_header.
    ULINE.
    FORMAT COLOR COL_KEY.
*   * Loop through each record and display in row
    LOOP AT int_flight_rec INTO _record WHERE _carrid = code.
      WRITE:/(1) '|', (8) _record-_carrid,
              (1) '|', (10) _record-_conn,
              (1) '|', (10) _record-_from,
              (1) '|', (12) _record-_to,
              (1) '|', (10) _record-_flytime,
              (1) '|', (10) _record-_dept,
              (1) '|',  _record-_arr, (1) '|'.

    ENDLOOP.
    ULINE.
*   * Display # of rows found
    FORMAT COLOR COL_TOTAL.
    SKIP.
    WRITE:/ 'Total Flights: ',number_of_records.
  ENDIF.
ENDIF.
