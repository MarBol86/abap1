CLASS zcl_03_12_passenger_plane_mb DEFINITION
  PUBLIC
  INHERITING FROM zcl_03_12_airplane_mb
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: airplane_type REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_12_passenger_plane_mb IMPLEMENTATION.
  METHOD airplane_type.
    rv_airplane_type = 'Passenger Plane'.
  ENDMETHOD.

ENDCLASS.
