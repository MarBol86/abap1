CLASS zcl_03_14_credit_card_mb DEFINITION
  PUBLIC   FINAL   CREATE PUBLIC. "Ambas clases puede o no llevar la adición FINAL

  PUBLIC SECTION.
    METHODS: set_card_num IMPORTING iv_card_nun TYPE string,
      get_card_num RETURNING VALUE(rv_card_num) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: credit_card_num TYPE string.
ENDCLASS.

CLASS zcl_03_14_credit_card_mb IMPLEMENTATION.
  METHOD set_card_num.
    me->credit_card_num = iv_card_nun.
  ENDMETHOD.

  METHOD get_card_num.
    rv_card_num = me->credit_card_num.
  ENDMETHOD.
ENDCLASS.
