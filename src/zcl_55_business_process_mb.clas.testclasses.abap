*"* use this source file for your ABAP unit test classes
CLASS ltcl_business_process DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      factorial_local_test FOR TESTING RAISING cx_static_check.
    CLASS-METHODS class_setup. "
    CLASS-METHODS class_teardown.
    METHODS setup.
    METHODS teardown.
    DATA: mo_cut TYPE REF TO zcl_55_business_process_mb. "CUT= Class Under Test
ENDCLASS.


CLASS ltcl_business_process IMPLEMENTATION.


  METHOD setup.
    mo_cut = NEW zcl_55_business_process_mb( ).
  ENDMETHOD.

  METHOD factorial_local_test.
* Given: los valores que vamos a dar
    DATA(lv_number_ut) = 4.
    DATA lv_factorial_ut TYPE i.

* When: Cuándo o cómo se va a realizan ese test
    mo_cut->get_factorial(
      EXPORTING iv_number    = lv_number_ut
      IMPORTING ev_factorial = lv_factorial_ut ).

* Then: Después
    IF cl_abap_unit_assert=>assert_equals(
          EXPORTING
            act                  = lv_factorial_ut
            exp                  = 24 ) EQ abap_true. "Es un método funcional que devuelve abap_true si tiene algún fallo.

      cl_abap_unit_assert=>fail( 'Factorial Proccess failed.' ). "Esta linea de ejecuta sólo si hay un fallo
    ENDIF.
  ENDMETHOD.

  METHOD teardown.
    CLEAR: mo_cut.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

ENDCLASS.
