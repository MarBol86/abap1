CLASS zcl_02_35_sales_department DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_02_35_saler_order_mb. "Sólo implementamos la última interfaz
* La clase que implementa una interfaz anidada está obligada a  implementar TODOS los métodos definidos en las anidadas
*Alias para el método
    ALIASES cl_aliases FOR zif_02_35_saler_order_mb~create_order.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_02_35_sales_department IMPLEMENTATION.

  METHOD zif_02_35_saler_order_mb~alias_if. "Usamos el alias pero a través de la otra interfaz
  ENDMETHOD.

  METHOD cl_aliases.
  ENDMETHOD.


ENDCLASS.
