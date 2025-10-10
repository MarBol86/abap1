CLASS zcl_03_28_mail_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
* Evento estático
    CLASS-EVENTS new_mail EXPORTING VALUE(ev_subject) TYPE string.
* Método estático
    CLASS-METHODS compose_mail.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_28_mail_mb IMPLEMENTATION.
  METHOD compose_mail.
    RAISE EVENT new_mail EXPORTING ev_subject =  |Job Offer { cl_abap_context_info=>get_system_time(  ) }| .
  ENDMETHOD.

ENDCLASS.
