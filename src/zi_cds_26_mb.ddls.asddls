@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '4.10. Proyección '
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_cds_26_mb //Agregamos ROOT
  provider contract transactional_interface //Indicamos el contrato en RAP tambien se utiliza el de transactional_query (tiene limitaciones)
  //el contract sql_query es para SOLO LECTURA, no es para RAP
  as projection on ZI_CDS_24_MB
{ //Seleccionamos los elementos que deseamos subir a la siguiente capa
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode : 'CurrencyCode'
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
      _Booking: redirected to composition child zi_cds_27_mb,
      _Customer
}
