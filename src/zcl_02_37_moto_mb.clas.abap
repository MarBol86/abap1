CLASS zcl_02_37_moto_mb DEFINITION ABSTRACT "Indicamos que es una clase abstracta
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Este método lo tenemos que implementar porque no es abstracto.
    METHODS set_hp IMPORTING iv_hp TYPE i.
  PROTECTED SECTION.
    "Con ABSTRACT luego del nombre le indicamos que el método es abstracto
    METHODS set_max_speed ABSTRACT IMPORTING iv_max_speed TYPE i.
    "Sólo es posible definir un MÉTODO como ABSTRACTO si la CLASE lleva el ABSTRACT
  PRIVATE SECTION.
    DATA: hp TYPE i.
ENDCLASS.

CLASS zcl_02_37_moto_mb IMPLEMENTATION.
  METHOD set_hp.

  ENDMETHOD.

ENDCLASS.
