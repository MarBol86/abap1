@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.8. Unión'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_05_mb
  as select from /dmo/travel
{
  key travel_id                  as TravelId,
      //3 OBLIGACIONES
      //1- Debe tener el mismo número de columnas
      //2- Todas las columnas por posición deberían tener el MISMO NOMBRE ALIAS en la proyección
      //3- Todas las columnas deberían tener el MISMO TIPO DE DATOS.
      cast('' as abap.numc( 4 )) as BookingID

}
// Para eliminar registros repetidos DISTINTC
union select distinct from /dmo/booking
{
  key travel_id  as TravelId,
      booking_id as BookingID
}
