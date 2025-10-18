CLASS zcl_58_singleton_mb DEFINITION
  PUBLIC FINAL
  CREATE PRIVATE . "Indicamos que sólo se puede crear el objeto dentro de la clase.
  "Tenemos que tener en cuenta que esta clase NO DEBERÍA OFRECER SU AMISTAD
  PUBLIC SECTION.
    DATA mv_time TYPE sy-uzeit.
    METHODS constructor. "El que crea la instancia
    "Necesitamos acceder a un método globalmente teniendo que encuenta que ya no es posible acceder a un método de instancia fuera de la clase
    CLASS-METHODS get_instance RETURNING VALUE(ro_instance) TYPE REF TO zcl_58_singleton_mb."EXPORTING también sería válido
*Nota: otra forma sería hacerlo con un CLASS-METHOD constructor
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: mo_instance TYPE REF TO zcl_58_singleton_mb. "ATRIBUTO ESTÁTICO
ENDCLASS.

CLASS zcl_58_singleton_mb IMPLEMENTATION.

  METHOD constructor.
    me->mv_time = cl_abap_context_info=>get_system_time( ).
  ENDMETHOD.

  METHOD get_instance.
    IF mo_instance IS NOT BOUND. "Si la clase NO se instanció
      mo_instance = NEW #(  ). "ACÁ VA A LLAMAR AL CONSTRUCTOR
    ENDIF.
    ro_instance = mo_instance.
  ENDMETHOD.

ENDCLASS.
