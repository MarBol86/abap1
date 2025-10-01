CLASS zcl_01_encapsulacion_class_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PROTECTED . "No se puede instanciar fuera de la clase. Sirve para controlar la cantidad de instancias
**********************************************************************
*Encapsulación de clases
**********************************************************************
*ENCAPSULACIÓN | Se instancia en | Hereda
*PUBLIC        | En otras clases | SI
*PROTECTED     | Sólo en hijas   | SI
*PRIVATE       | Sólo en si misma| NO
* Nota: siempre se puede instanciar dentro de sí misma
  PUBLIC SECTION.
    DATA : variable TYPE string.
    CLASS-METHODS get_instance EXPORTING er_instance TYPE REF TO zcl_01_encapsulacion_class_mb.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_01_encapsulacion_class_mb IMPLEMENTATION.
  METHOD get_instance.
* Sieve para controlar el número de instancias - algo que se verá con patrones de diseño
* Acá hariamos tambien un control de si el user tiene el permiso para generar la instancia
    er_instance = NEW #(  ).
  ENDMETHOD.
ENDCLASS.
