CLASS zcl_03_17_construction_mb DEFINITION
  PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_03_17_contract_mb .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_17_construction_mb IMPLEMENTATION.
  METHOD zif_03_17_contract_mb~create_contact.
    me->zif_03_17_contract_mb~contract_type = iv_cntr_type.
  ENDMETHOD.
ENDCLASS.
