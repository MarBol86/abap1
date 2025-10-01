CLASS zcl_01_const_instancia_mb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
* La Visibilidad de contructores tienen una fuerte relación con la visibilidad de la generación de la instancia.
* La visibilidad de constructor no puede ser más específica que la visibilidad de la creación instancia
* Depende del CREATE
    CLASS-DATA: company TYPE string READ-ONLY.
* Nombre del método reservado: CLASS_CONSTRUCTOR
* No puede tener parámetros ni excepciones
    CLASS-METHODS class_constructor . "Se UTILIZA para inicializar valores que son para todas las instancias
* CONSTRUCTOR IMPLÍCITO: Cuando no disponemos de firma en los parámetros
*    METHODS constructor.
* No se pueden usar parámetros de EXPORTING.
* Sólo admite IMPORTING y EXCEPTIONS
    METHODS constructor IMPORTING iv_employee_id TYPE string. "Puede ser OPTIONAL
* No hay sobre carga de constructores, es decir, que sólo se puede llamar una vez
    METHODS get_employee_id RETURNING VALUE(rv_emproyee_id) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: employee_id TYPE string.
ENDCLASS.

CLASS zcl_01_const_instancia_mb IMPLEMENTATION.

  METHOD constructor.
    me->employee_id = iv_employee_id.
  ENDMETHOD.

  METHOD get_employee_id.
    rv_emproyee_id = me->employee_id.
  ENDMETHOD.

  METHOD class_constructor. "Se ejecuta una sóla vez para con contexto donde se ejecuta la clase
    company = 'Logali'.
*Para indicar que es un miembro estático puedo utilizar el nombre de la clase
    zcl_01_const_instancia_mb=>company = 'Logali-Group' .
*Nota: No podemos acceder a los componentes de instancia.
*El estático no puede ver la instancia, en cambio, la instancia puede ver el estático.
  ENDMETHOD.

ENDCLASS.
