CLASS zcl_54_execute_mb DEFINITION
  PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS raise_exception_1 IMPORTING io_previos TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_51_exception1_mb.
    METHODS raise_exception_2 IMPORTING io_previos TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_52_exception2_mb.
    METHODS raise_exception_3 IMPORTING io_previos TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_53_exception3_mb.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_54_execute_mb IMPLEMENTATION.


  METHOD raise_exception_1.
    RAISE EXCEPTION TYPE zcx_51_exception1_mb
      EXPORTING
        previous = io_previos.
  ENDMETHOD.

  METHOD raise_exception_2.
    RAISE EXCEPTION TYPE zcx_52_exception2_mb
      EXPORTING
        previous = io_previos.
  ENDMETHOD.

  METHOD raise_exception_3.
    RAISE EXCEPTION TYPE zcx_53_exception3_mb
      EXPORTING
        previous = io_previos.
  ENDMETHOD.

ENDCLASS.
