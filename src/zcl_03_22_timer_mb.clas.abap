CLASS zcl_03_22_timer_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    "Definimos el evento EVENTS con su nombre
    EVENTS time_out EXPORTING VALUE(ev_hour) TYPE sy-uzeit. "Puede SÓLO EXPORTING VALUE para informar a la clase receptora + datos
    METHODS: increment_counter IMPORTING iv_counter TYPE i,
      check_limit.
**********************************************************************
    METHODS constructor. "AGREGAMOS EL MÉTODO CONSTRUCTOR
    DATA user TYPE string. "Agregamos un atributo
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: counter TYPE i.
ENDCLASS.

CLASS zcl_03_22_timer_mb IMPLEMENTATION.
  METHOD check_limit. "Método que posee la condición para levantar el evento
    IF me->counter GE 5.
      DATA(lv_hour) = cl_abap_context_info=>get_system_time( ).
      "Levantamos el evento
      RAISE EVENT time_out EXPORTING ev_hour = lv_hour. " Puede ser OPTIONAL, si lo defino
    ENDIF.
  ENDMETHOD.

  METHOD increment_counter.
    me->counter += iv_counter.
    me->check_limit( ).
  ENDMETHOD.

  METHOD constructor.
    me->user = sy-uname.
  ENDMETHOD.

ENDCLASS.
