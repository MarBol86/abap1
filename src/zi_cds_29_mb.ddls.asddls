@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyection Child Query'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_29_MB as projection on zi_cds_25_mb
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    /* Associations */
    _Travel : redirected to parent  ZI_CDS_28_MB
}
