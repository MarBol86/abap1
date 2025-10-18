CLASS zcl_63_play_mb DEFINITION ABSTRACT
  PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.
  PROTECTED SECTION.
    DATA: players_counter TYPE i.
* MÉTODOS ABSTRACTOS
    METHODS initialize_game ABSTRACT.
    METHODS create_game ABSTRACT IMPORTING iv_player TYPE i.
    METHODS end_game ABSTRACT RETURNING VALUE(rv_finalized) TYPE abap_bool.
    METHODS print_winner ABSTRACT.

* MÉTODO DE PLANTILLA | Es FINAL para que ninguna subclase lo pueda redefinir
    METHODS play  FINAL IMPORTING iv_platers TYPE i. "DEFINE EL ORDEN DE LOS PASOS
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_63_play_mb IMPLEMENTATION.
  METHOD play.
    DATA: lv_player TYPE i.
*   Limpiamos los atributos globales porque no sabemos cuántas veces se llamará al método
    CLEAR: me->players_counter.
    me->players_counter = iv_platers.
*   Llamamos a los métodos, a los pasos, así indicamos su orden.
    me->initialize_game( ).
    WHILE me->end_game( ) NE abap_true.
      me->create_game( lv_player  ).
      lv_player += lv_player.
    ENDWHILE.
    me->print_winner( ).
  ENDMETHOD.
ENDCLASS.
