@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '3.9. Navegación con Path Expression'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_19_mb
  as select from /dmo/booking //Arrancamos con el hijo
  //Le indicamos que si o si tenemos un padre
  association [1..1] to zi_cds_18_mb as _Travel on _Travel.TravelId = $projection.TravelId
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      _Travel //Publicamos la asociación
}
