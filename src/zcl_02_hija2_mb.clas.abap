CLASS zcl_02_hija2_mb DEFINITION INHERITING FROM zcl_02_hija_mb "Hereda de la otra que hereda
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
*Le agregamos método constructor a la clase hija
    METHODS constructor IMPORTING iv_quotation TYPE string "Mismo parámetro que la clase padre
                                  iv_products  TYPE string.
    DATA: products TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_02_hija2_mb IMPLEMENTATION.

  METHOD constructor.
    "Se debe instanciar el CONSTRUCTOR PADRE antes del código constructor de la clase hija
    super->constructor( iv_quotation = iv_quotation ).

    me->products = iv_products.

  ENDMETHOD.

ENDCLASS.
