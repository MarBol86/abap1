CLASS zcl_61_triangle_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_11_geometric_figure_mb.
    ALIASES draw_shape FOR zif_11_geometric_figure_mb~draw_shape.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_61_triangle_mb IMPLEMENTATION.

  METHOD zif_11_geometric_figure_mb~draw_shape.
    rv_shape = 'Triangle'.
  ENDMETHOD.

ENDCLASS.
