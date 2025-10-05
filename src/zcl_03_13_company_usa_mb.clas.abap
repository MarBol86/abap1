CLASS zcl_03_13_company_usa_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_03_13_company_mb .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_13_company_usa_mb IMPLEMENTATION.
  METHOD zif_03_13_company_mb~define_company.
    rv_company = 'Company EEUU....'.
  ENDMETHOD.
ENDCLASS.
