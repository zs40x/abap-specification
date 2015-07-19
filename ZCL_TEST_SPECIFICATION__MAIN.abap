class ZCL_TEST_SPECIFICATION definition
  public
  inheriting from ZCL_ABSTRACT_SPECIFICATION
  final
  create public .

public section.
*"* public components of class ZCL_TEST_SPECIFICATION
*"* do not include other source files here!!!

  type-pools ABAP .
  methods CONSTRUCTOR
    importing
      !I_IS_SATISFIED type ABAP_BOOL .

  methods ZIF_SPECIFICATION~IS_SATISFIED_BY
    redefinition .
protected section.
*"* protected components of class ZCL_TEST_SPECIFICATION
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_TEST_SPECIFICATION
*"* do not include other source files here!!!

  data M_IS_SATISFIED type ABAP_BOOL .
ENDCLASS.



CLASS ZCL_TEST_SPECIFICATION IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TEST_SPECIFICATION->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] I_IS_SATISFIED                 TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD constructor.

  super->constructor( ).

  me->m_is_satisfied = i_is_satisfied.

ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TEST_SPECIFICATION->ZIF_SPECIFICATION~IS_SATISFIED_BY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_OBJECT                      TYPE REF TO OBJECT
* | [<-()] R_IS                           TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD zif_specification~is_satisfied_by.

  r_is = me->m_is_satisfied.

ENDMETHOD.
ENDCLASS.