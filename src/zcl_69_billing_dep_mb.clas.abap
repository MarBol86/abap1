CLASS zcl_69_billing_dep_mb DEFINITION INHERITING FROM zcl_67_observer_mb
  PUBLIC FINAL  CREATE PUBLIC.

  PUBLIC SECTION.
  data: state TYPE string.
    METHODS: on_modified_state REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_69_billing_dep_mb IMPLEMENTATION.
  METHOD on_modified_state.
    me->state = ev_new_state.
  ENDMETHOD.

ENDCLASS.
