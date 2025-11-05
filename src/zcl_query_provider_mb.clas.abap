CLASS zcl_query_provider_mb DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
* Para ser implementada en el Object Model de la definición de la entidad necesita de la interfaz
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_query_provider_mb IMPLEMENTATION.
  METHOD if_rap_query_provider~select.

    DATA: lt_results TYPE TABLE OF zi_cds_20_mb. "Tabla interna con la estructura de la entidad personalizada
    TRY.
* ¿Se han solicitado los datos? T or F
        IF io_request->is_data_requested(  ). "No hace falta poner el EQ abap_true

          DATA(lv_top) = io_request->get_paging( )->get_page_size(  ).
          DATA(lv_skip) = io_request->get_paging( )->get_offset(  ).

          SELECT FROM /dmo/travel
          FIELDS *                "Para mejor rendimiento seleccionar campos puntuales. A los campos se les puede poner alias.
          ORDER BY travel_id ASCENDING
          INTO CORRESPONDING FIELDS OF TABLE @lt_results
* A nivel del servicio ODATA tenemos la obligación de manipular la paginación
          OFFSET @lv_skip
          UP TO @lv_top ROWS.

          IF sy-subrc EQ 0. "Informamos respuesta de la petición ODATA

            io_response->set_data( it_data =  lt_results ).
            io_response->set_total_number_of_records( iv_total_number_of_records = lines( lt_results )  ).

          ENDIF.

        ENDIF.

      CATCH cx_rap_query_response_set_twic INTO DATA(lx_exc).

    ENDTRY.
  ENDMETHOD.

ENDCLASS.
