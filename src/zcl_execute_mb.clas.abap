CLASS zcl_execute_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_execute_mb IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    zcl_01_encapsulacion_class_mb=>get_instance( IMPORTING  er_instance = DATA(lv_instance) ).
*    lv_instance->variable = 'Hola'.
*    out->write( lv_instance->variable ).
*    out->write( zcl_01_const_instancia_mb=>company ).
*    DATA(lo_employee) = NEW zcl_01_const_instancia_mb( '1234' ) .
*    out->write( lo_employee->get_employee_id(  ) ).
*    DATA(lo_employee2) = NEW zcl_01_const_instancia_mb( '4321' ) .
*    out->write( lo_employee2->get_employee_id(  ) ).
*    out->write( zcl_01_const_instancia_mb=>company ).

    DATA(lo_padre) = NEW zcl_02_padre_mb(  ).
    DATA(lo_hija)  = NEW zcl_02_hija_mb(  ).
    DATA(lo_hija2) = NEW zcl_02_hija2_mb(  ).

    lo_padre->set_company_code( '1234' ).
    lo_padre->set_currency( 'USD' ).
    lo_padre->get_company_code( IMPORTING ev_company_code = DATA(lv_company_code) ).
    lo_padre->get_currency( IMPORTING ev_currency = DATA(lv_currency) ).

    out->write( |{ lv_company_code } { lv_currency }| ).

  ENDMETHOD.
ENDCLASS.
