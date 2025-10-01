CLASS zcl_02_padre_mb DEFINITION "Clase: BASE, PADRE o SUPERCLASE
* DRY: Don't Repeat Yourself
* Las clases hijas contienen todo lo de sus padres.
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION. "todos y se Hereda
    METHODS: set_company_code IMPORTING iv_company_code TYPE string,
      get_company_code EXPORTING ev_company_code TYPE string,
      set_currency IMPORTING iv_currency TYPE string,
      get_currency EXPORTING ev_currency TYPE string.


  PROTECTED SECTION. "Sólo Hereda
    DATA: company_code TYPE c LENGTH 4,
          currency     TYPE c LENGTH 3.
  PRIVATE SECTION. "No Hereda
ENDCLASS.



CLASS zcl_02_padre_mb IMPLEMENTATION.
  METHOD get_company_code.
    ev_company_code = me->company_code.
  ENDMETHOD.

  METHOD get_currency.
    ev_currency = me->currency.
  ENDMETHOD.

  METHOD set_company_code.
    me->company_code = iv_company_code.

  ENDMETHOD.

  METHOD set_currency.
    me->currency = iv_currency.
  ENDMETHOD.

ENDCLASS.
