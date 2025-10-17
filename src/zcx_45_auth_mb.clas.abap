CLASS zcx_45_auth_mb DEFINITION "NOMENCLATURA: ZCX
  PUBLIC
  INHERITING FROM cx_static_check "Superclass
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message . " 2 Interfaces | T100 hace referencia a la tabla donde se encuentran los textos
    INTERFACES if_t100_dyn_msg .

    CONSTANTS: " En la sección pública pegamos nuestra constante
      BEGIN OF no_auth,
        msgid TYPE symsgid VALUE 'ZMC_MARBOL', "Clase de mensaje que creamos
        msgno TYPE symsgno VALUE '001',          "Número de mensaje que creamos
        attr1 TYPE scx_attrname VALUE 'MV_MSG1', "Los attr reemplazan los &
        attr2 TYPE scx_attrname VALUE 'MV_MSG2', "Se le ponen los nombres de las variables que creamos
        attr3 TYPE scx_attrname VALUE 'MV_MSG3', "La misma clase se encarga de asignar los valores que tenemos en los atributos
        attr4 TYPE scx_attrname VALUE 'MV_MSG4', "ampliando el método constructor
      END OF no_auth.
    CONSTANTS: "Otra constante
      BEGIN OF no_resource,
        msgid TYPE symsgid VALUE 'ZMC_MARBOL', "
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'MV_MSG1',
        attr2 TYPE scx_attrname VALUE 'MV_MSG2',
        attr3 TYPE scx_attrname VALUE 'MV_MSG3',
        attr4 TYPE scx_attrname VALUE 'MV_MSG4',
      END OF no_resource.

    DATA: mv_msg1 TYPE msgv1. "Creamos la variable que reemplazaremos en los &
    DATA: mv_msg2 TYPE msgv2.
    DATA: mv_msg3 TYPE msgv3.
    DATA: mv_msg4 TYPE msgv4.
    METHODS constructor "Método constructor con 2 parámetros opcionales.
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        iv_msg1   TYPE msgv1 OPTIONAL "Agregamos los atributos a la firma del constructor
        iv_msg2   TYPE msgv2 OPTIONAL "le decimos que son opcionales
        iv_msg3   TYPE msgv3 OPTIONAL
        iv_msg4   TYPE msgv4 OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_45_auth_mb IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).
    CLEAR me->textid.
    IF textid IS INITIAL. "Si no de indica texto levanta uno por default
      if_t100_message~t100key = if_t100_message=>default_textid. "Default_textid es una constante a la que podemos navegar
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
* Luego del Super asignamos los atributos que creamos apuntando a la clase y nro de mensaje que creamos.
    me->mv_msg1 = iv_msg1.
    me->mv_msg2 = iv_msg2.
    me->mv_msg3 = iv_msg3.
    me->mv_msg4 = iv_msg4.
  ENDMETHOD.
ENDCLASS.
