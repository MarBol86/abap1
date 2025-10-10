CLASS zcl_03_26_bankcliente_mb DEFINITION "Clase receptora que maneja el evento, RECEPTORA
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
*                                                     INTERFACE
    METHODS on_new_transfer FOR EVENT new_transfer OF zif_03_26_bank_mb
      IMPORTING sender. "Recibimos la referencia de la clase que levanta el evento
    DATA notification TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_26_bankcliente_mb IMPLEMENTATION.
  METHOD on_new_transfer.
    me->notification = |Atributo de la interfaz { sender->office } |.

  ENDMETHOD.

ENDCLASS.
