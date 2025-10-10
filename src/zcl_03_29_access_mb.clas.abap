CLASS zcl_03_29_access_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.
    METHODS on_blocked_entrance FOR EVENT blocked_entrance OF zcl_03_29_building_mb IMPORTING ev_entry.

    CLASS-DATA mt_blocked_entrance TYPE TABLE OF string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_29_access_mb IMPLEMENTATION.
  METHOD on_blocked_entrance.
    APPEND |{ ev_entry } entry blocked| TO mt_blocked_entrance.
  ENDMETHOD.

  METHOD constructor.
    "Si bien se instancie la clase, el manajeador ya está en escucha para todas las instancias.
    SET HANDLER me->on_blocked_entrance FOR ALL INSTANCES.
  ENDMETHOD.

ENDCLASS.
