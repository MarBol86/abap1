@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '3.1. Joins'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_10_MB
  as select from /dmo/travel  as Travel
    inner join   /dmo/booking as Booking on Booking.travel_id = Travel.travel_id
  // con AND o OR se agregan más condiciones
  //Se pueden agragar + INNER JOINs
{
  key Travel.travel_id   as TravelId,
  key Booking.booking_id as BookingId,
      Travel.agency_id   as AgencyId,
      Travel.begin_date  as BeginDate
}
