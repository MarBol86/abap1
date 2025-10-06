CLASS zcl_03_execute_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_execute_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA go_object TYPE REF TO object. "OBJECT es un tipo predefinido en abap, todas las clases son de este tipo.
    go_object = NEW zcl_03_18_product_mb(  ).

*    go_objec-> "NO FUNCIONA EL SEPARADOR

    DATA(lv_method_name) = 'RETURN_CATEGORY'. "Método en mayúscula

    "Hacemos llamada dinámica al método
    CALL METHOD go_object->(lv_method_name). "No podemos igualarlo a una variable, ni usar el out->write, ni declarar inline data(lv_receiving).
    DATA: lv_receiving TYPE string.
    CALL METHOD go_object->(lv_method_name) RECEIVING rv_category = lv_receiving.

    out->write( lv_receiving ).

  ENDMETHOD.

ENDCLASS.
