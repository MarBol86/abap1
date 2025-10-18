CLASS zcl_71_emp_view_mb DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  " La vista interactúa con la interfaz de usuario
  PUBLIC SECTION.
    "Muestra lo que el modelo va a indicar a través del controlador
    "La vista pude tener o no acceso al modelo, si lo tiene recibirá un REF TO
    METHODS display_employee IMPORTING iv_name TYPE string
                                       iv_role TYPE string
                                       io_out  TYPE REF TO if_oo_adt_classrun_out. "Lo agregamos para en este ejemplo poder mostrar los datos en la consola, NO FORMA PARTE DEL MODELO
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_71_emp_view_mb IMPLEMENTATION.
  METHOD display_employee.
*Tareas de la vista:
*                   1- Muestra los datos
*                   2- Recuperar los datos del campo de entrada y pasarlos al modelo
    io_out->write( |{ iv_name }---{ iv_role }| ).
  ENDMETHOD.

ENDCLASS.
