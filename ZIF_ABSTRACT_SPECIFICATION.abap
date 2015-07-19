class ZCL_ABSTRACT_SPECIFICATION definition
  public
  abstract
  create public .

public section.
*"* public components of class ZCL_ABSTRACT_SPECIFICATION
*"* do not include other source files here!!!

  interfaces ZIF_SPECIFICATION ABSTRACT METHODS is_satisfied_by.
protected section.
*"* protected components of class ZCL_ABSTRACT_SPECIFICATION
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_ABSTRACT_SPECIFICATION
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_ABSTRACT_SPECIFICATION IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ABSTRACT_SPECIFICATION->ZIF_SPECIFICATION~AND
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_OTHER_SPECIFICATION         TYPE REF TO ZIF_SPECIFICATION
* | [<-()] RO_SPECIFICATION               TYPE REF TO ZIF_SPECIFICATION
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD zif_specification~and.

  CREATE OBJECT ro_specification
    TYPE zcl_and_specification
    EXPORTING
      io_specification_x = me
      io_specification_y = io_other_specification.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ABSTRACT_SPECIFICATION->ZIF_SPECIFICATION~NOT
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RO_SPECIFICATION               TYPE REF TO ZIF_SPECIFICATION
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD zif_specification~not.

  CREATE OBJECT ro_specification
    TYPE zcl_not_specification
    EXPORTING
      io_other_specification = me.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ABSTRACT_SPECIFICATION->ZIF_SPECIFICATION~OR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_OTHER_SPECIFICATION         TYPE REF TO ZIF_SPECIFICATION
* | [<-()] RO_SPECIFICATION               TYPE REF TO ZIF_SPECIFICATION
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD zif_specification~or.

  CREATE OBJECT ro_specification
    TYPE zcl_or_specification
    EXPORTING
      io_specification_x = me
      io_specification_y = io_other_specification.

ENDMETHOD.
ENDCLASS.