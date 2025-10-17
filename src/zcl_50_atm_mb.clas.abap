CLASS zcl_50_atm_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter iv_card | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter iv_amount | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter iv_savings_account | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter rv_log | <p class="shorttext synchronized" lang="en"></p>
    METHODS withdraw_money IMPORTING iv_card            TYPE string
                                     iv_amount          TYPE i
                                     iv_savings_account TYPE abap_bool OPTIONAL
                           RETURNING VALUE(rv_log)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_50_atm_mb IMPLEMENTATION.
  METHOD withdraw_money.
    DATA(lo_bank) = NEW zcl_49_bank_mb(  ). "Instancia del banco

    TRY.
        lo_bank->validate_account(
          EXPORTING
            iv_card            = iv_card
            iv_amount          = iv_amount
            iv_savings_account = iv_savings_account
          CHANGING
            cv_log             = rv_log ).
**********************************************************************
* Si la excepción es REANUDABLE, vuelve a ejecutar lo que sigue aqui.
        rv_log = |{ Rv_log }...Withdraw money from the ATM { cl_abap_char_utilities=>newline }  |.
        rv_log = |{ Rv_log }...Operation completed succesfully { cl_abap_char_utilities=>newline }  |.

      CATCH               zcx_47_expired_cred_card_mb INTO DATA(lx_expired_card).
        rv_log = |{ Rv_log }...{ lx_expired_card->get_text( ) } { cl_abap_char_utilities=>newline }  |.

* Recordemos que la excepción zcx_48_insufficient_balance_mb PUEDE o No ser REANUDABLE
      CATCH BEFORE UNWIND zcx_48_insufficient_balance_mb INTO DATA(lx_insufficient_balance). "EXCEPCIÓN REANUDABLE

        rv_log = |{ Rv_log }...{ lx_insufficient_balance->get_text( ) } { cl_abap_char_utilities=>newline }  |.
* Para saber si es reanudable o no:
        IF lx_insufficient_balance->is_resumable EQ abap_true.
          "Withdraw from saving account
          rv_log = |{ Rv_log }...Resume exception { cl_abap_char_utilities=>newline }  |.
*RESUME indica que tiene que seguir ejecutando lo que está en el TRY
          RESUME. "Indica que se reanuda la excepción para seguir con la lógica
        ELSE.
          "Insufficient balance
          rv_log = |{ Rv_log }...NO Resume exception { cl_abap_char_utilities=>newline }  |.
        ENDIF.

    ENDTRY.

  ENDMETHOD.

ENDCLASS.
