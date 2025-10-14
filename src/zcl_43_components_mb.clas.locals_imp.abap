*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
* Van las DEFINICIONES que declaramos en Class-relevant Local Types
*- Lo mismo que antes + implementaciones
*- Implementación de clases/ iinterfaces
*- Podemos declarar tipos/Constantes
*- Se puede usar:
*---------------- Sólo en implementación de métodos de clases globales como locales
CLASS lcl_helper IMPLEMENTATION.
  METHOD get_first.
    rs_first-comp1 = 'Componente1' .
  ENDMETHOD.
ENDCLASS.

TYPES: BEGIN OF ty_first2,
         comp1 TYPE string,
         comp2 TYPE string,
         comp3 TYPE string,
       END OF ty_first2.
