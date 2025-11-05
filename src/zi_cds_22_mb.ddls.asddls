@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS para modelo Jerárquico'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_22_MB
  as select from zemployee_mb as Employee
  // Hacemos una asociación con la MISMA CDS
  association [0..1] to ZI_CDS_22_MB as _Manager on _Manager.Employee = $projection.Manager
{
  key Employee.employee as Employee,
      Employee.manager  as Manager,
      Employee.name     as Name,
      _Manager
}
