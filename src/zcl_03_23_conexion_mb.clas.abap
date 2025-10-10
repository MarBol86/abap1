CLASS zcl_03_23_conexion_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    DATA hour TYPE sy-uzeit.
    DATA: sender_user TYPE string.
* Nomenclatura recomendada: ON_ + NOMBRE_EVENTO antes definido
*                       FOR EVENT indica que es un método manejador
*                                 EVENTO   OF CLASE
    METHODS on_time_out FOR EVENT time_out OF zcl_03_22_timer_mb
      IMPORTING ev_hour "tiene los parámetros IMPORTING que el EVENTO EXPOTING
                sender. "Aunque no se ha definido existe la posibilidad de usar el IMPORTING del SENDER
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_23_conexion_mb IMPLEMENTATION.
  METHOD on_time_out.
* Acciones que se harán cuando se dispare el evento
    me->hour = cl_abap_context_info=>get_system_time( ).
    me->sender_user = sender->user. "!!!!!!!!!!!!!!!!!!!!!!!
  ENDMETHOD.

ENDCLASS.
