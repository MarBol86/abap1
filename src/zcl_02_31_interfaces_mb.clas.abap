CLASS zcl_02_31_interfaces_mb DEFINITION "Clase que implementa la interfaz, dá vida a los métodos
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES zif_02_32_interface_mb.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: agency_type TYPE string.
ENDCLASS.

CLASS zcl_02_31_interfaces_mb IMPLEMENTATION.

  METHOD zif_02_32_interface_mb~set_name. " Nombre de la interfaz ~ Método
    me->agency_type = iv_type.
  ENDMETHOD.

  METHOD zif_02_32_interface_mb~get_name.
    rv_type = me->agency_type.
  ENDMETHOD.

  METHOD zif_02_32_interface_mb~set_address.
    "Accedemos a los atributos de la INTERFACE con ~
    zif_02_32_interface_mb~agency_address = iv_address.
    "Si fuera de instancia con el ME adelante!!!!!
  ENDMETHOD.

ENDCLASS.
