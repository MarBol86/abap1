CLASS zcx_47_expired_cred_card_mb DEFINITION INHERITING FROM cx_static_check
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
* Si le pongo la herencia manual, debo incluir manualmente las 2 interfaces
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .
*****************CONTANTES********************************************
    CONSTANTS:
      BEGIN OF card_expired,
        msgid TYPE symsgid VALUE 'ZMC_MARBOL', "
        msgno TYPE symsgno VALUE '003', "Your Card is expired and retainer by the ATM
        attr1 TYPE scx_attrname VALUE 'MV_MSG1',
        attr2 TYPE scx_attrname VALUE 'MV_MSG2',
        attr3 TYPE scx_attrname VALUE 'MV_MSG3',
        attr4 TYPE scx_attrname VALUE 'MV_MSG4',
      END OF  card_expired.
****************VARIABLES*********************************************
    DATA: mv_msg1 TYPE msgv1.
    DATA: mv_msg2 TYPE msgv2.
    DATA: mv_msg3 TYPE msgv3.
    DATA: mv_msg4 TYPE msgv4.
****************CONSTRUCTOR*******************************************
    METHODS constructor "Método constructor con 2 parámetros opcionales.
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        iv_msg1   TYPE msgv1 OPTIONAL "Agregamos los atributos a la firma del constructor
        iv_msg2   TYPE msgv2 OPTIONAL "le decimos que son opcionales
        iv_msg3   TYPE msgv3 OPTIONAL
        iv_msg4   TYPE msgv4 OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_47_expired_cred_card_mb IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = previous ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->mv_msg1 = iv_msg1.
    me->mv_msg2 = iv_msg2.
    me->mv_msg3 = iv_msg3.
    me->mv_msg4 = iv_msg4.

  ENDMETHOD.

ENDCLASS.
