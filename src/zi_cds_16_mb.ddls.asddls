@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '3.6. Asoc. filtrada - Path Expression'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_16_MB
  as select from /dmo/travel
  association [0..*] to I_CurrencyText as _Currency on _Currency.Currency = $projection.CurrencyCode
{
  key travel_id     as TravelId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      _Currency[1: Language = $session.system_language ].CurrencyName //filtro que reduce la cardinalidad
      //con 1: antes del filtro podemos indicar la cardinalidad. 
      //esto modifica la cardinalidad de la association
}
