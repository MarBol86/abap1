@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.11. Conversión Cantidades'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_09_mb
  as select from zqty_mb
{
  key product            as ProductID,
      @Semantics.quantity.unitOfMeasure: 'OriginalUnit'
      quantity           as OriginalQty,
      unit               as OriginalUnit,
      //Las tasas de conversión de instalan por el equipo Basis

      @Semantics.quantity.unitOfMeasure: 'ConvertedUnit'
      unit_conversion( quantity       => quantity,
                       source_unit    => unit,
                       target_unit    => abap.unit'MI',
                       error_handling => 'SET_TO_NULL',
                       client         => $session.client
                       ) as ConvertedQuantity,
      abap.unit'MI'      as ConvertedUnit
}
