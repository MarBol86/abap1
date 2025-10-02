CLASS zcl_02_test_02_document_mb DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS set_title IMPORTING iv_title TYPE string.
  PRIVATE SECTION.
    DATA: title TYPE string.
ENDCLASS.



CLASS zcl_02_test_02_document_mb IMPLEMENTATION.

  METHOD set_title.
    me->title = iv_title.
  ENDMETHOD.

ENDCLASS.
