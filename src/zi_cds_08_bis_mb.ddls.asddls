@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.10. Conversión Importes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_08_bis_MB
  with parameters
    pFromCurrency : abap.cuky(5), //listado de parámetros separados con coma
    pToCurrency :  abap.cuky(5),
    @Environment.systemField: #SYSTEM_DATE //Desde la variable de entorno lo inyectamos la fecha del sistema
    pDocumentData: abap.dats
  as select from /dmo/travel
{
  key travel_id                                              as TravelId,
      @Semantics.amount.currencyCode: 'OriginalCurrency'
      total_price                                            as OriginalPrice,
      currency_code                                          as OriginalCurrency,
      @Semantics.amount.currencyCode: 'ConvertedCurrency'
      currency_conversion( amount             => total_price,
                           source_currency    => $parameters.pFromCurrency,
                           target_currency    => $parameters.pToCurrency,
                           exchange_rate_date => begin_date,
                           client => $session.client,
                           error_handling => 'SET_TO_NULL' ) as ConvertedPrice,
      $parameters.pToCurrency                             as ConvertedCurrency
}
where
  currency_code = $parameters.pFromCurrency;
