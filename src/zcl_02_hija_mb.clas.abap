CLASS zcl_02_hija_mb DEFINITION INHERITING FROM zcl_02_padre_mb "Citamos de quien hereda
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
*Método existente en la clase PADRE, lo podemos redefinir en la hija
    METHODS set_company_code REDEFINITION. "No se modifica la firma del método
*No podemos cambiar la visibilidad
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_02_hija_mb IMPLEMENTATION.
  METHOD set_company_code.

    me->company_code = '999'.
* Podemos mantener la lógica/funcionalidad del padre o no
    super->set_company_code( iv_company_code = iv_company_code ).
* NO tenemos la restrición que lo de super esté primero.
  ENDMETHOD.

ENDCLASS.
