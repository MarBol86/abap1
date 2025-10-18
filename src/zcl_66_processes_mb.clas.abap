CLASS zcl_66_processes_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS set_state IMPORTING iv_state TYPE string.
    METHODS get_state RETURNING VALUE(rv_state) TYPE string.

    EVENTS modified_state EXPORTING VALUE(ev_new_state) TYPE string. "Definimos el Evento
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: current_state TYPE string.
ENDCLASS.

CLASS zcl_66_processes_mb IMPLEMENTATION.

  METHOD set_state.

    me->current_state = iv_state.
    RAISE EVENT modified_state "Levantamos el evento
      EXPORTING
        ev_new_state = me->current_state .
  ENDMETHOD.

  METHOD get_state.
    rv_state = me->current_state.
  ENDMETHOD.

ENDCLASS.
