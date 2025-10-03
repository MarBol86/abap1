INTERFACE zif_02_32_interface_mb
  PUBLIC . "Click derecho--> New --> Interface --> Nomenclatura ZIF
* SOLO HACEMOS LAS DECLARACIONES
* Podemos declarar métodos estáticos o de instancia
  METHODS:  set_name IMPORTING iv_type TYPE string,
            get_name RETURNING VALUE(rv_type) TYPE string.

  CLASS-METHODS set_address IMPORTING iv_address TYPE string.

* Podemos declarar atributos estáticos o dinámicos (tipos, constantes)
  CLASS-DATA agency_address TYPE string.

ENDINTERFACE.
