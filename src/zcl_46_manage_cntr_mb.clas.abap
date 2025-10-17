CLASS zcl_46_manage_cntr_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS check_user IMPORTING iv_user TYPE syuname
                       RAISING   zcx_45_auth_mb. "Levantamos una excepción con el tipo de clase de la ZCX
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_46_manage_cntr_mb IMPLEMENTATION.
  METHOD check_user.
    IF sy-uname NE 'un user'.
* Levantamos una excpción| del TYPE de la clase = esto va a crear una INSTANCIA de la clase.
      RAISE EXCEPTION TYPE zcx_45_auth_mb
        EXPORTING
          textid  = zcx_45_auth_mb=>no_auth "Vinculamos al mensaje creado
*         previous =
          iv_msg1 = |{ sy-uname }| "Lo convertimos en una cadena de caracteres
          iv_msg2 = |{ sy-repid }|
*         iv_msg3 =
*         iv_msg4 =
        .
    ENDIF.
  ENDMETHOD.

ENDCLASS.
