class ZCL_AND_SPECIFICATION definition
  public
  inheriting from ZCL_ABSTRACT_SPECIFICATION
  final
  create public .

public section.
*"* public components of class ZCL_AND_SPECIFICATION
*"* do not include other source files here!!!

  methods CONSTRUCTOR
    importing
      !IO_SPECIFICATION_X type ref to ZIF_SPECIFICATION
      !IO_SPECIFICATION_Y type ref to ZIF_SPECIFICATION .

  methods ZIF_SPECIFICATION~IS_SATISFIED_BY
    redefinition .
protected section.
*"* protected components of class ZCL_AND_SPECIFICATION
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_AND_SPECIFICATION
*"* do not include other source files here!!!

  data MO_SPECIFICATION_ONE type ref to ZIF_SPECIFICATION .
  data MO_SPECIFICATION_OTHER type ref to ZIF_SPECIFICATION .
ENDCLASS.



CLASS ZCL_AND_SPECIFICATION IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_AND_SPECIFICATION->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_SPECIFICATION_X             TYPE REF TO ZIF_SPECIFICATION
* | [--->] IO_SPECIFICATION_Y             TYPE REF TO ZIF_SPECIFICATION
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD constructor.

  super->constructor( ).

  me->mo_specification_one    = io_specification_x.
  me->mo_specification_other  = io_specification_y.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_AND_SPECIFICATION->ZIF_SPECIFICATION~IS_SATISFIED_BY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_OBJECT                      TYPE REF TO OBJECT
* | [<-()] R_IS                           TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD zif_specification~is_satisfied_by.

  IF      me->mo_specification_one->is_satisfied_by( io_object ) = abap_true
      AND me->mo_specification_other->is_satisfied_by( io_object ) = abap_true.
    r_is = abap_true.
  ENDIF.

ENDMETHOD.
ENDCLASS.