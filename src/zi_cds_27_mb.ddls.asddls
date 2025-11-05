@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyection Child'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_cds_27_mb
//Le tenemos que indicar que tiene una relación de REDIRECCIONAMIENTO con el padre, de composición
//Le tenemos que avisar a la capa de proyección, la relación que hay en la otra capa
  as projection on zi_cds_25_mb
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
      _Travel: redirected to parent zi_cds_26_mb
}
