CLASS zcl_00_execute_mb DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
* Interfaces anidada: Una interfaz puede implementar a otra interfaz
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_00_execute_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
* Hacemos 3 bloques try
    DATA(lo_execution) = NEW zcl_54_execute_mb(  ).

    TRY.
        TRY.
            TRY.
                lo_execution->raise_exception_1( ).

              CATCH zcx_51_exception1_mb INTO DATA(lx_1).
                lo_execution->raise_exception_2( lx_1 ).
            ENDTRY.

          CATCH zcx_52_exception2_mb INTO DATA(lx_2).
            lo_execution->raise_exception_3( lx_2 ).
        ENDTRY.

      CATCH zcx_53_exception3_mb INTO DATA(lx_3).
        "Texto de la capa 3
        out->write( |{ lx_3->get_text(  ) } { cl_abap_char_utilities=>newline } | ).
        "Texto de la capa 2 con PREVIOUS
        out->write( |{ lx_3->previous->get_text(  ) } { cl_abap_char_utilities=>newline } | ).
        "Texto de la capa 1 con PREVIOUS PREVIOUS
        out->write( |{ lx_3->previous->previous->get_text(  ) } { cl_abap_char_utilities=>newline } | ).
        "Es de buena práctica asegurarnos que objeto esté instanciado
        IF lx_3->previous->previous IS BOUND.
        ENDIF.

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
