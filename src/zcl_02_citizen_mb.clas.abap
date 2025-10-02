CLASS zcl_02_citizen_mb DEFINITION
  PUBLIC
*  FINAL "Es opcional | Rompe el árbol de herenc<ia
*Mensaje de error en la hija "Cannot have aby subclass"
  CREATE PROTECTED.

  PUBLIC SECTION.
    "Para que el método no se pueda redefinir en las hijas
    METHODS set_id FINAL IMPORTING iv_id TYPE i.
  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_02_citizen_mb IMPLEMENTATION.

  METHOD set_id.

  ENDMETHOD.

ENDCLASS.
