CLASS zcl_02_storage_location_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
* Establecemos cuáles son sus clases amigas | Nota: para locales Sólo FRIENDS
  GLOBAL FRIENDS zcl_02_plant_mb. "Le ofrece acceso a los miembros de la encapsulación PRIVADA

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION. "No se hereda, solo accesible en la misma clase y las amigas
    DATA product TYPE string.
    METHODS set_product IMPORTING iv_product  TYPE string.
ENDCLASS.

CLASS zcl_02_storage_location_mb IMPLEMENTATION.
  METHOD set_product.
    me->product = iv_product.
  ENDMETHOD.

ENDCLASS.
