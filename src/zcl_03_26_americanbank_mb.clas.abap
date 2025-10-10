CLASS zcl_03_26_americanbank_mb DEFINITION "CLASE QUE IMPLEMENTA LA INTERFAZ LEVANTA EL EVENTO
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_03_26_bank_mb. "No tenemos la obligación de implementar un método porque la IF sólo define un evento

    METHODS create_notification RETURNING VALUE(rv_text) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_03_26_americanbank_mb IMPLEMENTATION.
  METHOD create_notification.
    zif_03_26_bank_mb~office = 'NEW YORK'.
    rv_text = 'Event Raise'.
    RAISE EVENT zif_03_26_bank_mb~new_transfer.
  ENDMETHOD.

ENDCLASS.
