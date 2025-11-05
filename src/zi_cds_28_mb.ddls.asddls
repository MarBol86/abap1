@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '4.12 Projection - Contract Type Query'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CDS_28_MB //Agregamos el ROOT
  provider contract transactional_query //Existe para el modelo RAP
  as projection on ZI_CDS_24_MB
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZI_CDS_29_MB,
      _Customer
}
