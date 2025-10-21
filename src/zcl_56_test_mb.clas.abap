CLASS zcl_56_test_mb DEFINITION FOR TESTING "Agregamos el FOR TESTING
  PUBLIC FINAL CREATE PUBLIC
  DURATION SHORT                             "Agregamos la duración
  RISK LEVEL HARMLESS.                       "Agregamos el nivel de riesgo

  PUBLIC SECTION.
*                       Método de test
* Anotaciones, es un comando para la documentación ABAP
* Anotación de testing + objeto = Establecemos la relación
    "! @testing zcl_55_business_process_mb
    METHODS factorial_test FOR TESTING. "UTM - Unit Test Method
    "Se pueden levantar errores con RAISING.
  PROTECTED SECTION.
  PRIVATE SECTION.
* SETUP y TEARDOWN podrían ser método estáticos, pero se recomienda usar de instancia.
* Si son estáticos se llamarán una vez al principio y al final de todo el TEST
    CLASS-METHODS class_setup. "
    CLASS-METHODS class_teardown.
*En cambio, los de instancia se llamarán antes y despues de CADA TEST.
    METHODS setup. " Se llama antes de ejecutar el método de test | Instanciamos objetos que necesitamos
    METHODS teardown. "Se llama al finalizar el método de test | Eliminamos o hacemos el clear de lo que inicializamos en el setup
    DATA: mo_cut TYPE REF TO zcl_55_business_process_mb. "CUT= Class Under Test
ENDCLASS.

CLASS zcl_56_test_mb IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW zcl_55_business_process_mb( ).
  ENDMETHOD.

  METHOD factorial_test.

* En el TDD - Test Driven Development tenemos el:
**********************************************************************
* Given: los valores que vamos a dar
    DATA(lv_number_ut) = 4.
    DATA lv_factorial_ut TYPE i.
**********************************************************************
* When: Cuándo o cómo se va a realizan ese test
    mo_cut->get_factorial(
      EXPORTING iv_number    = lv_number_ut
      IMPORTING ev_factorial = lv_factorial_ut ).
**********************************************************************
* Then: Después
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_factorial_ut
        exp                  = 24 ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR: mo_cut.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

ENDCLASS.
