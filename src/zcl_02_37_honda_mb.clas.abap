CLASS zcl_02_37_honda_mb DEFINITION ABSTRACT INHERITING FROM zcl_02_37_moto_mb
*                        Indicamos que es abstracta y que hereda de la anterior clase
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS set_model ABSTRACT EXPORTING model TYPE string.

  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_02_37_honda_mb IMPLEMENTATION.
ENDCLASS.
