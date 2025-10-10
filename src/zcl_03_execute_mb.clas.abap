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
**********************************************************************
*   4 instancias de la clase que DEFINE
    DATA(go_north_building) = NEW zcl_03_29_building_mb(  ).
    DATA(go_south_building) = NEW zcl_03_29_building_mb(  ).
    DATA(go_east_building) = NEW zcl_03_29_building_mb(  ).
    DATA(go_west_building) = NEW zcl_03_29_building_mb(  ).
**********************************************************************
* Clase manajadora
    DATA(go_access) = NEW zcl_03_29_access_mb(  ).
*OPCIÓN 1 ************************************************************
*   Escuchamos |CL manejadora->método         |para| Clases que define ---> Establecemos 1 manejador para las 4 instancias
    SET HANDLER go_access->on_blocked_entrance FOR go_north_building.
    SET HANDLER go_access->on_blocked_entrance FOR go_south_building.
    SET HANDLER go_access->on_blocked_entrance FOR go_east_building.
    SET HANDLER go_access->on_blocked_entrance FOR go_west_building.
*OPCIÓN 2 ************************************************************
    SET HANDLER go_access->on_blocked_entrance FOR ALL INSTANCES.
*OPCIÓN 3 ************************************************************
*Hacerlo en la clase manejadora con método constructor
**********************************************************************
* Asignamos valor al atributo de instancia público de cada objeto
    go_north_building->entry = 'north'.
    go_south_building->entry = 'south'.
    go_east_building->entry = 'east'.
    go_west_building->entry = 'west'.
**********************************************************************
* Método que tiene dentro el RAISE EVENT
    go_north_building->close_entry( ).
    go_south_building->close_entry( ).
    go_east_building->close_entry( ).
    go_west_building->close_entry( ).
**********************************************************************
* Variable de la clase manejadora que almacena las entradas en el método ON_BLOCKED_ENTRANCE
    out->write( zcl_03_29_access_mb=>mt_blocked_entrance ).

  ENDMETHOD.

ENDCLASS.
