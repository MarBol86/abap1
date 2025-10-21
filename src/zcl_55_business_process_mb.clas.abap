CLASS zcl_55_business_process_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
**********************************************************************
*Clase que contiene los procesos de Negocio
* Las unidades abap representan los métodos de las clases donde tenemos los procesos de negocios
    METHODS get_factorial IMPORTING iv_number    TYPE i
                          EXPORTING ev_factorial TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_55_business_process_mb IMPLEMENTATION.
  METHOD get_factorial.
    CHECK iv_number GT 0.
    DATA(lv_number) = iv_number.

* Factorial of 4 = 1x2x3x4 = 24
    ev_factorial = 1.

    WHILE lv_number NE 0.
      ev_factorial = ev_factorial * lv_number.
      lv_number -= 1.
    ENDWHILE.
  ENDMETHOD.

ENDCLASS.
