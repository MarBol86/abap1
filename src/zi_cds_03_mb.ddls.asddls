@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.5. Variables de sesión'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CDS_03_MB
  as select from /dmo/customer
{ 
  key customer_id              as CustomerID,
      // Con F1 en el nombre de la variable podemos ver info adicional
      $session.client          as ClientField,
      $session.system_date     as SystDate,
      $session.system_language as SystemLanguage,
      $session.user            as UserField,
      $session.user_date       as UserDate,
      $session.user_timezone   as UserTz

      //Hay 2 variables que no se pueden utilizar
      //      $session.bs_instance_id  as BSIntanceID,
      //      $session.bs_zone_id      as BSZoneID
}
