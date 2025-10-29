@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '3.3. Asociaciones'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_12_MB
  as select from /dmo/travel as Travel
  //La asociación trae el concepto de CARDINALIDAD
  // Registros posibles y esperados
  // [0..*] = [*] de 0 a muchos
  // [1..*] de 1 a muchos
  // [1..1] de 1 a 1
  // [1] de 0 a 1
  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId //Travel.customer_id
  association [1..1] to /dmo/agency   as _Agency   on _Agency.agency_id = $projection.AgencyId
{
  key Travel.travel_id                                                 as TravelId,
      Travel.customer_id                                               as CustomerId,
      concat_with_space(_Customer.first_name, _Customer.last_name, 2 ) as CustomerName,
      Travel.agency_id                                                 as AgencyId,
      _Agency.name                                                     as AgencyName
}
