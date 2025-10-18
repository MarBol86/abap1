CLASS zcl_64_monopoly_mb DEFINITION INHERITING FROM zcl_63_play_mb
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION. "Se implementan todos los método menos el que arranca el proceso, el de los pasos.
    METHODS: initialize_game REDEFINITION,
             create_game REDEFINITION,
             end_game REDEFINITION,
             print_winner REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_64_monopoly_mb IMPLEMENTATION.
  METHOD create_game.

  ENDMETHOD.

  METHOD end_game.

  ENDMETHOD.

  METHOD initialize_game.

  ENDMETHOD.

  METHOD print_winner.

  ENDMETHOD.

ENDCLASS.
