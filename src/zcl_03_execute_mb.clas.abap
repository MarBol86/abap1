CLASS zcl_03_execute_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_execute_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: gt_companies TYPE STANDARD TABLE OF REF TO zif_03_13_company_mb,
          gi_company   TYPE REF TO zif_03_13_company_mb,  " Las interfaces no se pueden instanciar
          go_eu        TYPE REF TO zcl_03_13_company_eu_mb,
          go_usa       TYPE REF TO zcl_03_13_company_usa_mb,
          go_plant     TYPE REF TO zcl_03_13_plant_mb.

    go_eu = NEW #(  ).            "Instancio el objeto
    APPEND go_eu TO gt_companies. "Guardo el objeto en la tabla
    go_usa = NEW #(  ).           "Instancio el objeto
    APPEND go_usa TO gt_companies."Guardo el objeto en la tabla

    go_plant = NEW #(  ).

    LOOP AT gt_companies INTO gi_company.

      out->write( go_plant->assign_company( ir_company =  gi_company ) ).
*     Plant was assigned to.... Company Europe....
*     Plant was assigned to.... Company EEUU....
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
