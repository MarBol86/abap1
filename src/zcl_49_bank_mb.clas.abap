CLASS zcl_49_bank_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS validate_account IMPORTING iv_card            TYPE string
                                       iv_amount          TYPE i
                                       iv_savings_account TYPE abap_bool OPTIONAL
                             CHANGING  cv_log             TYPE string
                             RAISING   zcx_47_expired_cred_card_mb "Puede levantar esta excepción o...
                                       RESUMABLE(zcx_48_insufficient_balance_mb). "Excepción REANUDABLE
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_49_bank_mb IMPLEMENTATION.
  METHOD validate_account.
*1. Expired Credit Card***********************************************
    cv_log = |{ cv_log }...Checking card validity { cl_abap_char_utilities=>newline } |.
    IF iv_card = '1111 2222 3333 4444'.
      RAISE EXCEPTION TYPE zcx_47_expired_cred_card_mb
        EXPORTING
          textid = zcx_47_expired_cred_card_mb=>card_expired. "Fin método
    ENDIF..
*2. Insufficient balance in the current account***********************
    cv_log = |{ cv_log }...Checking account balance { cl_abap_char_utilities=>newline } |.

    IF iv_amount GT 50.

      IF iv_savings_account EQ abap_true.
*3. Witdraw money from de saving account******************************
        cv_log = |{ cv_log }...Resumable exception Insufficient Balance { cl_abap_char_utilities=>newline } |.
        RAISE RESUMABLE EXCEPTION TYPE zcx_48_insufficient_balance_mb
          EXPORTING
            textid = zcx_48_insufficient_balance_mb=>insufficient_balance.
      ELSE.
        cv_log = |{ cv_log }...Exception Insufficient Balance { cl_abap_char_utilities=>newline } |.
        RAISE EXCEPTION TYPE zcx_48_insufficient_balance_mb "LEVANTAMOS LA MISMA EXCEPCIÓN PERO NO ES REANUDABLE
          EXPORTING
            textid = zcx_48_insufficient_balance_mb=>insufficient_balance.
      ENDIF.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
