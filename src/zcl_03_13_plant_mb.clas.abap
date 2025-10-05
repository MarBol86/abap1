CLASS zcl_03_13_plant_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*                                  Parámetro de importing del tipo de la interfaz
    METHODS assign_company IMPORTING ir_company      TYPE REF TO zif_03_13_company_mb
                           RETURNING VALUE(rv_plant) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_13_plant_mb IMPLEMENTATION.
  METHOD assign_company.
*                                              Llamada al método funcional
    rv_plant = | Plant was assigned to.... { ir_company->define_company(  ) }|.
  ENDMETHOD.
ENDCLASS.
