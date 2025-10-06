INTERFACE zif_03_17_contract_mb
  PUBLIC .
  DATA: contract_type TYPE string.

  METHODS create_contact IMPORTING iv_cntr_type TYPE string.
ENDINTERFACE.
