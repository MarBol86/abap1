CLASS zcl_00_execute_mb DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
* Interfaces anidada: Una interfaz puede implementar a otra interfaz
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_00_execute_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(go_business_process) = NEW zcl_55_business_process_mb(  ).

    go_business_process->get_factorial( EXPORTING iv_number = 5
    IMPORTING ev_factorial = DATA(lv_factorial) ).
    out->write( | { lv_factorial } | ).


  ENDMETHOD.
ENDCLASS.
