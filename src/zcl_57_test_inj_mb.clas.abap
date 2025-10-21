CLASS zcl_57_test_inj_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_customer EXPORTING es_customer TYPE /dmo/customer.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_57_test_inj_mb IMPLEMENTATION.
  METHOD get_customer.

    DATA: ls_customer TYPE /dmo/customer.
    DATA: lv_customer TYPE /dmo/customer_id VALUE '000001' .

    SELECT SINGLE FROM /dmo/customer
    FIELDS *
    WHERE customer_id = @lv_customer
    INTO @es_customer.

**********************************************************************
*Asingamos el bloque test-seam | Sólo se ejecutará con el ABAP UNIT
*             Nombre del bloque
    TEST-SEAM select_data.
      SELECT SINGLE FROM /dmo/customer
      FIELDS *
      WHERE customer_id =  @lv_customer
      INTO @ls_customer. "Cambio donde guardo la data en el test.
    END-TEST-SEAM.  "Fin del bloque
      IF lv_customer = '000015'. "En la clase test le pasamos este nro
        es_customer = CORRESPONDING #( ls_customer ).
      ENDIF.

  ENDMETHOD.

ENDCLASS.
