CLASS zcl_03_28_smtp_mb DEFINITION "Clase manejadora
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
* Si el evento es estático, el método manejador será estático
    CLASS-METHODS on_new_mail FOR EVENT new_mail OF zcl_03_28_mail_mb
      IMPORTING ev_subject.
* MT -> para tablas
    CLASS-DATA mt_inbox TYPE TABLE OF string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_28_smtp_mb IMPLEMENTATION.
  METHOD on_new_mail.
    APPEND ev_subject TO mt_inbox.
  ENDMETHOD.

ENDCLASS.
