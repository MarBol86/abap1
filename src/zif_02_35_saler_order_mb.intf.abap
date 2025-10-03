INTERFACE zif_02_35_saler_order_mb "Singular
  PUBLIC .
* Esta interfaz va a implementar a la anterior interfaz
  INTERFACES zif_02_35_document_mb. "Plural
  "No nos hace implementar la interfaz, porque las interfaces no llevan implementación
  METHODS create_order IMPORTING iv_order_id TYPE string.
* Indica que de ahora en adelante el alias_if se podrá utilizar para llamar al método set_sales_doc
  ALIASES alias_if FOR zif_02_35_document_mb~set_sales_doc.
ENDINTERFACE.
