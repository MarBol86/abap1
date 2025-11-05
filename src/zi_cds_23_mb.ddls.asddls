@AccessControl.authorizationCheck: #NOT_ALLOWED
define hierarchy ZI_CDS_23_MB
  as parent child hierarchy(
    source ZI_CDS_22_MB
    child to parent association _Manager
    start where
      Manager is initial //es para cuando hay parámetros
    siblings order by
      Employee
    multiple parents allowed
    orphans ignore
    cycles breakup //Nodo en que no se puede determinar la relación
    //    generate spantree //Se asegura que no hay múltiples padres
    cache on
  )
{
  key Employee,
      Manager,
      Name,
      $node.parent_id             as ParentId,
      $node.node_id               as NodeId,
      $node.hierarchy_is_cycle    as HIsCicle,
      $node.hierarchy_is_orphan   as HIsOrphan,
      $node.hierarchy_level       as HLevel,
      $node.hierarchy_parent_rank as HParentRank,
      $node.hierarchy_rank        as HRank,
      $node.hierarchy_tree_size   as HTreeSize //Volumen del arbol, cantidad de registros, cantidad de ventas

}
