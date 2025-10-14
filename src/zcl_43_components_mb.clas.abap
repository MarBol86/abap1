CLASS zcl_43_components_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_44_comp_friends_mb.

  PUBLIC SECTION. "No podemos usar lo que definimos en Class-Relevant
    METHODS get_first EXPORTING ev_first TYPE string.
  PROTECTED SECTION.
    DATA: ms_second TYPE ty_first.
  PRIVATE SECTION.
    DATA: ms_second2 TYPE ty_first.
    DATA: mo_helper TYPE REF TO lcl_helper. "Atributo que hace referencia a la clase local
ENDCLASS.

CLASS zcl_43_components_mb IMPLEMENTATION.
  METHOD get_first.
    DATA: second TYPE ty_first2. "Pero aquí si podemos utilizar lo que definimos en Class-Relevant
    ev_first = ms_second2-comp1.
  ENDMETHOD.

ENDCLASS.
