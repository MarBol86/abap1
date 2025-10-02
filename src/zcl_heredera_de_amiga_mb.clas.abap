CLASS zcl_heredera_de_amiga_mb DEFINITION INHERITING FROM zcl_02_plant_mb
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_product_sl.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_heredera_de_amiga_mb IMPLEMENTATION.
  METHOD get_product_sl.
* Puede acceder a los atributos privados de la amiga de su padre
    DATA(lo_storage_location) = NEW zcl_02_storage_location_mb(  ).
    lo_storage_location->product = 'PC'.
    lo_storage_location->set_product( iv_product = 'Notebook'  ).
  ENDMETHOD.

ENDCLASS.
