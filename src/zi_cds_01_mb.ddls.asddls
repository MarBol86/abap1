@AbapCatalog.viewEnhancementCategory: [#NONE]    //Categoría de ampliación, es un array.
@AccessControl.authorizationCheck: #NOT_REQUIRED //Autorización es mediante DCL = Data Control Languaje
@EndUserText.label: '2.1. CDS - Creación'        //Descripción
@Metadata.ignorePropagatedAnnotations: true      //Metadatos
//El Object Model lleva las 3 propiedades del Usage Type, se las puede acceder de 2 maneras
// @ObjectModel.usageType.serviceQuality: #X    o la otra manera:
@ObjectModel.usageType:{
    serviceQuality: #X, //Calidad de sercicio con ayuda de búsquera veremos las opciones y lo que significan
    sizeCategory: #S,
    dataClass: #MIXED
}
// Si sólo trabajo con el UUID, sin clave semántica puedo establecer una para el usuario
// @ObjectModel.semanticKey: [ 'AirlineID', 'ConnectionID', 'FligthDate' ]
define view entity ZI_CDS_01_MB
  as select from /dmo/flight //Al menos 1 fuente: Otra CDS o una tabla BD
{     //Entre las llaves proyectamos los elementos en base a las múltiples fuentes
      // El mandante se ignora
      //Con Ctrl + Space autocompleta el nombre del campo, el tipo de dato lo determina el from,
      /* CLAVE TÉCNICA del modo GUID = SYSUUID */
      // No son representativas para los usuarios finales.
      //  key UUID,
      /* CLAVES SEMÁNTICA */
  key carrier_id                                                 as AirlineID, //No se está obligado a poner CLAVES
  key connection_id                                              as ConnectionId,
  key flight_date                                                as FligthDate,
      //Para los campos IMPORTE y Cantidad, tenemos que indicar la moneda o la cantidad de medida
      @Semantics.amount.currencyCode: 'Currency' //Las anotaciones corresponden a la columna de abajo
      @EndUserText.label: 'Price'
      price                                                      as Price,
      currency_code                                              as Currency,
      // CASTING: Se aplica para la conversión del tipo de dato de los elementos que proyectamos
      //Es una función de BD
      //Agregamos una columna que no tiene nada que ver con la fuente de donde se seleccionan los datos
      'USD'                                                      as CurrencyDocumento, // CONTANTE
      '20260101'                                                 as DateString, //Fecha de tipo STRING
      //2 Parámetros 1-Valor: puede ser la constante o un campo o función que anide un valor
      //             2-Tipo: va luego del primer AS
      cast('20260101' as abap.dats )                             as DateDate,
      1.2                                                        as FloatringPointElement,
      // OTRO CAST
      fltp_to_dec(1.2 as abap.dec( 4, 2 ))                       as DecimalElement,
      //Idioma 2 CASTs
      cast( cast('E' as abap.lang ) as sylangu preserving type ) as idioma
      //CAST como función de HANA para convertir elementos a un tipo diferente.
      //TIPOS abap. o tipos de los elementos de datos
}
