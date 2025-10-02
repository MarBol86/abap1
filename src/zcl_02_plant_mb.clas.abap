CLASS zcl_02_plant_mb DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_product RETURNING VALUE(rv_product) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_02_plant_mb IMPLEMENTATION.
  METHOD get_product.
    DATA(lo_storage_location) = NEW zcl_02_storage_location_mb(  ).
* No podemos acceder a los atributos privados | Salvo que en la otra clase esté declarada la amistad
    lo_storage_location->product = 'PC'.
    lo_storage_location->set_product( iv_product = 'Notebook'  ).
    rv_product = lo_storage_location->product.
  ENDMETHOD.

ENDCLASS.
