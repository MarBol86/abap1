CLASS zcl_70_emp_model_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
* Los datos del constructor suelen venir de la capa de persistencia o servicios
* El Método constructor es el encargado de interactuar con la fuente de datos
    METHODS constructor IMPORTING iv_name TYPE string
                                  iv_role TYPE string.
    METHODS set_name IMPORTING iv_name TYPE string.
    METHODS get_name RETURNING VALUE(rv_name) TYPE string.
    METHODS set_role IMPORTING iv_role TYPE string.
    METHODS get_role RETURNING VALUE(rv_role) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: name TYPE string,
          role TYPE string.
ENDCLASS.

CLASS zcl_70_emp_model_mb IMPLEMENTATION.
  METHOD constructor.
    me->name = iv_name.
    me->role = iv_role.
  ENDMETHOD.

  METHOD get_name.
    rv_name = me->name.
  ENDMETHOD.

  METHOD get_role.
    rv_role = me->role.
  ENDMETHOD.

  METHOD set_name.
    me->name = iv_name.
  ENDMETHOD.

  METHOD set_role.
    me->role = iv_role.
  ENDMETHOD.

ENDCLASS.
