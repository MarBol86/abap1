@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '4.7. Define Root Entity'
@Metadata.ignorePropagatedAnnotations: true //Anotación que nos Obliga a usar el @Semantic, recomendable que esté
define root view entity ZI_CDS_24_MB as select from /dmo/travel
//Si no se aclara cardinalidad es de 0..1
composition [0..*] of zi_cds_25_mb as _Booking //Se refiere a posiciones - Confirma que es el padre - Es obligatorio publicarla
association [1..1] to /DMO/I_Agency as _Agency on _Agency.AgencyID = $projection.AgencyId
association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode : 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    status as Status,
    createdby as Createdby,
    createdat as Createdat,
    lastchangedby as Lastchangedby,
    lastchangedat as Lastchangedat,
    _Agency,
    _Customer,
    _Booking
//    _association_name // Make association public //detalles de la plantilla para publicar diferentes asociacionesd
}
