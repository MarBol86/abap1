CLASS zcl_03_14_client_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION. "En asociación no es necesario que haya setter y getters.
    METHODS: set_credit_card  IMPORTING ir_credit_card TYPE REF TO zcl_03_14_credit_card_mb,
      get_credit_card  RETURNING VALUE(rr_credit_card) TYPE REF TO zcl_03_14_credit_card_mb.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA credit_card TYPE REF TO zcl_03_14_credit_card_mb. "Tiene una asociación con la anterior clase
ENDCLASS.

CLASS zcl_03_14_client_mb IMPLEMENTATION.
  METHOD set_credit_card.
    me->credit_card = ir_credit_card .
  ENDMETHOD.

  METHOD get_credit_card.
    rr_credit_card = me->credit_card.
  ENDMETHOD.
ENDCLASS.
