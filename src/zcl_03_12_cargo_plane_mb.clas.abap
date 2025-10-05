CLASS zcl_03_12_cargo_plane_mb DEFINITION
  PUBLIC
  INHERITING FROM zcl_03_12_airplane_mb
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: airplane_type REDEFINITION. "Redefinimos el método del padre ABSTRACTO
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_12_cargo_plane_mb IMPLEMENTATION.
  METHOD airplane_type.
    rv_airplane_type = 'Cargo Plane'.
  ENDMETHOD.

ENDCLASS.
