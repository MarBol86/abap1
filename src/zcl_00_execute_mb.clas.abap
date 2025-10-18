CLASS zcl_00_execute_mb DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
* Interfaces anidada: Una interfaz puede implementar a otra interfaz
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_00_execute_mb IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
* Lo que el usuario ingresaría por pantalla
    DATA: lv_name TYPE string VALUE 'John Smith',
          lv_role TYPE string VALUE 'Developer'.
* El modelo tiene el rol de pasar los datos a la vista y de recuperarlos
* El modelo puede recibir los datos de la vista para hacer actualizaciones a la BD u obtenerlos de la BD
    DATA(lo_model) = NEW zcl_70_emp_model_mb( iv_name = lv_name iv_role = lv_role ). "Simulamos los datos desde la capa de persistencia
    DATA(lo_view) = NEW zcl_71_emp_view_mb( ).
    DATA(lo_controller) = NEW zcl_72_emp_controller_mb( ).

*EJECUCIÓN: Todo se maneja a través del CONTROLADOR
    lo_controller->set_model( io_model = lo_model ).
    lo_controller->set_view( io_view = lo_view ).

    lo_controller->get_view( )->display_employee(
      iv_name = lo_model->get_name( ) "El mismo CONTROLADOR va a consultar con el MODELO
      iv_role = lo_model->get_role( )
      io_out  = out ).

  ENDMETHOD.
ENDCLASS.
