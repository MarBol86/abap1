CLASS zcl_cds1_path_exp_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds1_path_exp_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM zi_cds_19_mb AS Booking
    FIELDS Booking~TravelId,
           Booking~BookingId,
           \_Travel-AgencyId, "Con la \ llegamos a las asociaciones
           \_Travel\_Agency-name AS AgencyName,
           \_Travel\_Customer-customer_id,
           concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 1 ) AS CustomerName
    WHERE Booking~CarrierId EQ 'AA'
    INTO TABLE @DATA(lt_results)
    UP TO 5 ROWS.

    IF sy-subrc EQ 0.
      out->write( lt_results ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
