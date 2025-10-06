CLASS zcl_03_15_laptop_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.            "Se utiliza IO importing object para no confundir con los rangos
    METHODS constructor IMPORTING io_keyboard TYPE REF TO zcl_03_15_keyboard_mb.
    DATA keyboard TYPE REF TO  zcl_03_15_keyboard_mb.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_15_laptop_mb IMPLEMENTATION.
  METHOD constructor.
    me->keyboard = io_keyboard.
  ENDMETHOD.
ENDCLASS.
