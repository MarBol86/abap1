CLASS zcl_03_execute_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_execute_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(go_components) = NEW zcl_43_components_mb(  ).


  ENDMETHOD.

ENDCLASS.
