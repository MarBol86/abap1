*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
* Equivalente a declarar en la sección privada
*-- Se puede usar dentro de:
*-------------------------- implementaciones de métodos
*---------------------------miembros privados de la clase global
* - TYPES: Estructuras
* - CONSTANTS
* - Interfaces definition
* - Class Definition
*************************** NO son accesibles desde la instancia.
TYPES: BEGIN OF ty_first,
         comp1 TYPE string,
         comp2 TYPE string,
         comp3 TYPE string,
       END OF ty_first,
       tty_first TYPE STANDARD TABLE OF ty_first.

CONSTANTS: lc_string TYPE string VALUE '1234'. "No es posible definir variables y supuestamente tampoco constantes.

INTERFACE lif_private_helper. "En singular porque la estamos definiendo
  "Como todos sus componentes son públicos no es necesario aclararlo
  DATA ms_first TYPE ty_first. "Podemos usar la estructura que definimos aqui
ENDINTERFACE. "Podemos definir varias

CLASS lcl_helper DEFINITION CREATE PRIVATE.  "SÓLO la DEFINITION con "lcl" tenemos dispobible el autocompletar

  PUBLIC SECTION.
    DATA ms_fisrt_cl_local TYPE ty_first.
    METHODS get_first RETURNING VALUE(rs_first) TYPE ty_first.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.
