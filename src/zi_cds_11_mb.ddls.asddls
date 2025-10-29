@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '3.2. Categoría de datos Texto'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity zi_cds_11_mb
  as select from /dmo/oall_stat_t
{ // Relación identificador con su texto
      @ObjectModel.text.element: [ 'Text' ] //Se pueden especificar múltiples elementos de texto
  key overall_status as OverallStatus,
      @Semantics.language: true //Identificamos que tenemos el mismo texto para múltiples idiomas
  key language       as Language,
      @Semantics.text: true
      text           as Text
}
