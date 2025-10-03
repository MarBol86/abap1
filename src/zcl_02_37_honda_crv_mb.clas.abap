CLASS zcl_02_37_honda_crv_mb DEFINITION INHERITING FROM zcl_02_37_honda_mb
*      Ni bien le indicamos que hereda nos da error y dice que tenemos que IMPLEMENTAR o REDEFINIR los métodos.
  PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    "No podemos subir el nivel de la encapsulación de su padre y/o abuelo
    METHODS: set_model REDEFINITION,
      set_max_speed REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_02_37_honda_crv_mb IMPLEMENTATION.
  METHOD set_max_speed.

  ENDMETHOD.

  METHOD set_model.

  ENDMETHOD.

ENDCLASS.
