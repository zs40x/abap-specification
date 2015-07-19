class ZCL_NOT_SPECIFICATION definition
  public
  inheriting from ZCL_ABSTRACT_SPECIFICATION
  final
  create public .

public section.
*"* public components of class ZCL_NOT_SPECIFICATION
*"* do not include other source files here!!!

  methods CONSTRUCTOR
    importing
      !IO_OTHER_SPECIFICATION type ref to ZIF_SPECIFICATION .

  methods ZIF_SPECIFICATION~IS_SATISFIED_BY
    redefinition .
protected section.
*"* protected components of class ZCL_NOT_SPECIFICATION
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_NOT_SPECIFICATION
*"* do not include other source files here!!!

  data MO_OTHER_SPECIFICATION type ref to ZIF_SPECIFICATION .
ENDCLASS.



CLASS ZCL_NOT_SPECIFICATION IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_NOT_SPECIFICATION->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_OTHER_SPECIFICATION         TYPE REF TO ZIF_SPECIFICATION
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD constructor.

  super->constructor( ).

  me->mo_other_specification = io_other_specification.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_NOT_SPECIFICATION->ZIF_SPECIFICATION~IS_SATISFIED_BY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_OBJECT                      TYPE REF TO OBJECT
* | [<-()] R_IS                           TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD zif_specification~is_satisfied_by.

  IF me->mo_other_specification->is_satisfied_by( io_object ) = abap_false.
    r_is = abap_true.
  ENDIF.

ENDMETHOD.
ENDCLASS.