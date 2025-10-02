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

*    DATA(lo_padre) = NEW zcl_02_padre_mb(  ).

*
*    lo_padre->set_company_code( '1234' ).
*    lo_padre->set_currency( 'USD' ).
*    lo_padre->get_company_code( IMPORTING ev_company_code = DATA(lv_company_code) ).
*    lo_padre->get_currency( IMPORTING ev_currency = DATA(lv_currency) ).
*
*    out->write( |{ lv_company_code } { lv_currency }| ).
** La CLASE HIJA tendrá los MISMOS ATRIBUTOS y MÉTODOS que la CLASE PADRE
    DATA(lo_hija)  = NEW zcl_02_hija_mb( 'quota'  ).
* A pesar de que le paso el IV de la clase padre, no falla y pasa por la lógica de la hija
    lo_hija->set_company_code( iv_company_code = '123' ).
    lo_hija->set_currency( 'ARS' ).
*    lo_hija->get_company_code( IMPORTING ev_company_code = lv_company_code ).
*    lo_hija->get_currency( IMPORTING ev_currency = lv_currency ).
*
*    out->write( |{ lv_company_code } { lv_currency }| ).

*    DATA(lo_padre) = NEW zcl_02_padre_mb( 'quota' ).
** Cuando se llama a un método de la clase hija se instancia todo el arbol de herencia
*    DATA(lo_hija2) = NEW zcl_02_hija2_mb( iv_quotation = 'quota1' iv_products = 'Producto' ).
*    lo_hija2->set_company_code( '1234' ).
*    lo_hija2->set_currency( 'USD' ).
*    lo_hija2->get_company_code( IMPORTING ev_company_code = DATA(lv_company_code) ).
*    lo_hija2->get_currency( IMPORTING ev_currency = DATA(lv_currency) ).
*
*    out->write( |{ lv_company_code } { lv_currency }| ).

    DATA(lo_animal) = NEW zcl_02_animal_mb(  ).
    DATA(lo_lion)   = NEW zcl_02_lion_mb(  ).

    out->write( lo_animal->walk(  ) ). "El animal anda
    out->write( lo_lion->walk(  ) ). "El león anda
*Narrowing | UP Casting | No es una copia! apuntamos en memoria
* Referencia    | apuntamos
*clase superior | Instancia clase inferior
*    lo_animal   = lo_lion.
    "Implementa el método de la clase hija
    out->write( lo_animal->walk(  ) ). "El león anda
    out->write( lo_lion->walk(  ) ). "El león anda

*Widening | DOWN Casting | No es una copia! apuntamos en memoria
* Para que funcione antes necesitamos un UP CAST
    lo_animal   = lo_lion.
* Referencia    | apuntamos
*clase inferior | Instancia clase superior
*       lo_lion = lo_animal. "Me dice que no es posible porque la clase inferior del arbol puede tener + funcionalidad
    lo_lion     ?= lo_animal.
* con el ?= le indico al compilador que si es posible
* Si en verdad no se puede hacer levantará un excepción    CX_SY_MOVE_CAST_ERROR
    out->write( lo_animal->walk(  ) ). "El león anda
    out->write( lo_lion->walk(  ) ).   "El león anda

  ENDMETHOD.
ENDCLASS.
