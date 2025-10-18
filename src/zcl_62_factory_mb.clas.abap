CLASS zcl_62_factory_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_shape IMPORTING iv_shape_type        TYPE string
                      RETURNING VALUE(ro_shape_type) TYPE REF TO  zif_11_geometric_figure_mb.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_62_factory_mb IMPLEMENTATION.

  METHOD get_shape.
* Según el importing instanciamos la clase que corresponde.
    CASE iv_shape_type.
      WHEN 'Circle'.
        ro_shape_type = NEW zcl_59_circule_mb( ).
      WHEN 'Square'..
        ro_shape_type = NEW zcl_60_square_mb( ).
      WHEN 'Triangle'.
        ro_shape_type = NEW zcl_61_triangle_mb( ).
    ENDCASE.
  ENDMETHOD.

ENDCLASS.
