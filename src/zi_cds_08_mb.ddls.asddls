@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.10. Conversión Importes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_08_MB
  as select from /dmo/travel
{
  key travel_id                                              as TravelId,
      @Semantics.amount.currencyCode: 'OriginalCurrency'
      total_price                                            as OriginalPrice,
      currency_code                                          as OriginalCurrency,
      //Aplicamos conversiones a los importes en base a una nueva moneda
      //Podemos insertar la firma de la función de conversión, sólo agrega parámetros obligatorios
      @Semantics.amount.currencyCode: 'ConvertedCurrency' //Reference information missiong, significa que falta el elemento semántico
      currency_conversion( amount             => total_price,
                           source_currency    => currency_code,
                           target_currency    => cast('USD' as abap.cuky( 5 )), //Espera un tipo cuky abap.cuky'USD'
                           exchange_rate_date => begin_date, //Le indicamos la fecha de conversión podemos usar $session, se estila fecha doc
                           client => $session.client, //Parámetro opcional
      //Arroja DUMP porque no está la parametría realizada en las tablas que inician con TCURR
      //En la documentación nos informa de los posibles valores para el error_handling
                           error_handling => 'SET_TO_NULL' ) as ConvertedPrice,
      cast( 'USD' as abap.cuky )                             as ConvertedCurrency
} where currency_code = 'EUR'
