CLASS zcl_execute_mb DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
* Interfaces anidada: Una interfaz puede implementar a otra interfaz
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_execute_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_object) = NEW zcl_02_test2_mb(  ).
    lo_object->zif_02_test_mb~set_name( iv_name = 'Lorena' ).
    CLEAR lo_object->zif_02_test_mb~name.

    lo_object->zif_02_test_mb~set_name( iv_name = 'ALICIA' ).
    out->write( lo_object->zif_02_test_mb~name ).



  ENDMETHOD.
ENDCLASS.
