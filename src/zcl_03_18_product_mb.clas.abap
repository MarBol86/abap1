CLASS zcl_03_18_product_mb DEFINITION
  PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS return_category RETURNING VALUE(rv_category) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: category TYPE string VALUE 'A5'.
ENDCLASS.

CLASS zcl_03_18_product_mb IMPLEMENTATION.
  METHOD return_category.
    rv_category = me->category.
  ENDMETHOD.
ENDCLASS.
