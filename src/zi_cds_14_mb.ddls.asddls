@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '3.4. Asociaciones con parámetros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_14_mb
  as select from /dmo/travel as Travel
  association [1..1] to ZI_CDS_13_MB as _Agency on _Agency.AgencyId = $projection.AgencyId
{
  key Travel.travel_id                   as TravelId,
      Travel.agency_id                   as AgencyId,
      _Agency( pCountryCode: 'US' ).Name as AgencyName //Lo puedo pasar con parámetros
}
