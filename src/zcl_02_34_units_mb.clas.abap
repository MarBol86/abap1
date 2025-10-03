CLASS zcl_02_34_units_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES: zif_02_34_unit_cm_mb,
      zif_02_34_unit_inches_mb.

    METHODS constructor IMPORTING iv_unit TYPE decfloat16 .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: unit     TYPE decfloat16.
ENDCLASS.

CLASS zcl_02_34_units_mb IMPLEMENTATION.
  METHOD zif_02_34_unit_cm_mb~dimensions_centimeters. "Método de una INTERFAZ
    rv_unit = me->unit * '2.54' .
  ENDMETHOD.

  METHOD zif_02_34_unit_inches_mb~dimensions_inches. "Método de otra INTERFAZ
    rv_unit = me->unit.
  ENDMETHOD.

  METHOD constructor.
    me->unit = iv_unit.
  ENDMETHOD.

ENDCLASS.
