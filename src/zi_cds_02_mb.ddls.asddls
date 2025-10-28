@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.4. Case'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_02_MB
  as select from /dmo/customer
{
  key customer_id as CustomerID,
      case country_code //Por ejemplo para estados
      when 'US' then last_name // No presenta problema porque es del mismo tipo string
      when 'WS' then cast( last_changed_at as abap.char( 30 ) ) //Tenemos que castear
      when 'DE' then concat('Germany - ', concat_with_space(last_name, first_name, 2) )
      when 'ES' then concat( 'Spain', last_name ) //Sólo admite 2 elementos
      when 'AT' then concat( 'Pais AT', concat( last_name, first_name ) ) //anidar concat
      else 'Another Country Code' //Si ninguna de las condiciones se aplica, con el nombre del campo dejamos el dato tal cual está
      end         as Case1, //Nombre de la Columna
      // La salida-->Lo que proyectamos luego del THEN-->Debería ser del mismo tipo de dato

      case //Para condiciones lógicas
      when country_code = 'US'or country_code = 'ES' then title
      when title = 'Mr.' then last_name
      // Fecha del día: $session.system_date
      // Función para restar días dats_add_days
      when cast('20300101' as abap.dats) < dats_add_days( $session.system_date, -30, 'NULL' ) then 'Lower Date'
      else 'No Condition applied'
      end         as Case2,

      //CASE ANIDADOS
      case //Para condiciones lógicas
      when country_code = 'US'or country_code = 'ES' then case title
                                                           when 'Mr.' then 'US-ES - Mr.'
                                                           when 'Mrs.' then 'US-ES - Mrs.'
                                                           else 'US-ES - Diferent Title'
                                                          end
      else 'No Condition applied'
      end as Case3

}
