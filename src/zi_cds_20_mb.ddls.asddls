@EndUserText.label: '4.1. Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_QUERY_PROVIDER_MB' //Indicamos el nombre de la clase ABAP.
define custom entity ZI_CDS_20_MB
  // No hay AS SELECT FROM--> la lógica de la query se implementa en una capa ABAP.
{
      //Nombre         : Tipo           ';' separa
  key travel_id   : /dmo/travel_id;
      agency_id   : /dmo/agency_id;
      customer_id : /dmo/customer_id;
}
