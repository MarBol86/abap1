@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.9. Funciones de agregación'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_07
  as select from /dmo/travel
{
  key travel_id,
      agency_id,
      cast( total_price as abap.dec( 16, 2 )) as total_price,
      currency_code
}
