@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.9. Funciones de agregación'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_06_MB
  as select from ZI_CDS_07
{
  key travel_id                               as TravelId,
      agency_id                               as AgencyId,
// Las agregaciones siempre es mejor incorporarlas en otros CDS que se incorporen a la CDS principal
      @Semantics.amount.currencyCode: 'CurrencyCode'
      min( total_price )                      as MinPrice,

            @Semantics.amount.currencyCode: 'CurrencyCode'
      max( total_price )                      as MaxPrice,

            @Semantics.amount.currencyCode: 'CurrencyCode'
      sum( total_price )                      as SumPrice,

      count( distinct total_price )           as CountDistPrice,

      count( * )                              as CountAllPrice, //Indica un único registro porque hay uno por clave

      //El promedio se resolverá en una nueva definición
      @Semantics.amount.currencyCode: 'CurrencyCode'
      avg( total_price as abap.dec( 16, 2 ) ) as AvgPrice,

      currency_code                           as CurrencyCode
}
group by //Agregamos todo el resto de las columnas que no tengan funciones de agregación y terminamos con ";".
  travel_id, //No podemos usar los alias a no ser que consumamos otra CDS,
  agency_id, //Si podemos usar lo que las fuentes nos ofrecen.
  currency_code;
