CLASS zcl_44_comp_friends_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_helper.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_44_comp_friends_mb IMPLEMENTATION.
  METHOD get_helper.
    "Instanciamos un objeto que ya nos había ofrecido la amistad
    DATA(lo_components) = NEW zcl_43_components_mb( ).
    lo_components->mo_helper->ms_fisrt_cl_local-comp1 = 'atributo de la clase local'.
* Los amigos reciben acceso a los componentes privados de la clase :)
* Y a su vez accedemos a los componentes locales.
*OJO tiene acceso a los métodos, no a los componentes LOCALES.
  ENDMETHOD.


ENDCLASS.
