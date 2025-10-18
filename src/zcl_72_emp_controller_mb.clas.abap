CLASS zcl_72_emp_controller_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS set_model IMPORTING io_model TYPE REF TO zcl_70_emp_model_mb.
    METHODS get_model RETURNING VALUE(ro_model) TYPE REF TO zcl_70_emp_model_mb.

    METHODS set_view IMPORTING io_view TYPE REF TO zcl_71_emp_view_mb.
    METHODS get_view RETURNING VALUE(ro_view) TYPE REF TO zcl_71_emp_view_mb.
  PROTECTED SECTION.
  PRIVATE SECTION.
* El CONTROLADOR tiene acceso a la VISTA y el MODELO
    DATA: model TYPE REF TO zcl_70_emp_model_mb,
          view  TYPE REF TO zcl_71_emp_view_mb.
ENDCLASS.

CLASS zcl_72_emp_controller_mb IMPLEMENTATION.

  METHOD set_model.
    me->model = io_model.
  ENDMETHOD.

  METHOD set_view.
    me->view = io_view.
  ENDMETHOD.

  METHOD get_model.
    ro_model = me->model.
  ENDMETHOD.

  METHOD get_view.
    ro_view = me->view.
  ENDMETHOD.

ENDCLASS.
