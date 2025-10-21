*"* use this source file for your ABAP unit test classes
CLASS ltcl_test_injection DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.
  PUBLIC SECTION. "Agregamos la encapsulación pública ya que las INTERFACES viven allí.
    INTERFACES if_a4c_bc_handler. "Podemos agregar interfaces en las clases de testing al igual que en otro tipo de clases
    INTERFACES if_a4c_cp_service PARTIALLY IMPLEMENTED. "O podemos hacerlo de manera parcial e implementar sólo alguno de los métodos
* La IMPLEMENTACIÓN PARCIAL es sólo permitida en clases de TEST
  PRIVATE SECTION.
    METHODS:
      get_customer_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.
    METHODS setup.
    METHODS teardown.

    DATA: mo_cut TYPE REF TO zcl_57_test_inj_mb. "CUT= Case Unit Test
ENDCLASS.


CLASS ltcl_test_injection IMPLEMENTATION.

  METHOD get_customer_test.

    me->mo_cut->get_customer( IMPORTING es_customer = DATA(ls_customer) ).
    IF cl_abap_unit_assert=>assert_equals(
         act                  = |{ ls_customer-customer_id }-{ ls_customer-country_code }|
         exp                  = '000015-US'
*       ignore_hash_sequence = abap_false
*       tol                  =
*       msg                  =
*       level                = if_abap_unit_constant=>severity-medium
*       quit                 = if_abap_unit_constant=>quit-test
       ) EQ abap_true.
      cl_abap_unit_assert=>fail( 'Get Customer process failed--> zcl_57_test_inj_mb->get_customer' ). "Normalmente se suele indicar la clase
    ENDIF.
  ENDMETHOD.

  METHOD class_setup.
    "Cuando tenemos varios recursos combiene hacerlo aqui
  ENDMETHOD.

  METHOD class_teardown.
    "Cuando tenemos varios recursos combiene hacerlo aqui
  ENDMETHOD.

  METHOD setup.
    me->mo_cut = NEW #(  ).
    "Se puede hacer aqui o en el método de test
    TEST-INJECTION select_data. "Mismo nombre que en la clase global
      lv_customer = '000015'.
      ls_customer-customer_id = lv_customer.
      ls_customer-country_code = 'US'.
      ls_customer-city = 'New York'.
    END-TEST-INJECTION.
  ENDMETHOD.

  METHOD teardown.
    CLEAR: me->mo_cut.
  ENDMETHOD.

ENDCLASS.
