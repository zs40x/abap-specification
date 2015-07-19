*"* use this source file for your ABAP unit test classes

*----------------------------------------------------------------------*
*       CLASS lcl_abstract_specification_tst DEFINITION
*----------------------------------------------------------------------*
CLASS lcl_abstract_specification_tst DEFINITION.

  PROTECTED SECTION.

    DATA:
      mo_null_object TYPE REF TO object ##needed.

    METHODS:
      get_specification
        IMPORTING
          i_is_satisfied  TYPE abap_bool
        RETURNING value(ro_specification) TYPE REF TO zif_specification,
      get_and_specification
        IMPORTING
          i_is_satisfied_x  TYPE abap_bool
          i_is_satisfied_y  TYPE abap_bool
        RETURNING value(ro_specification) TYPE REF TO zif_specification,
      get_or_specification
        IMPORTING
          i_is_satisfied_x  TYPE abap_bool
          i_is_satisfied_y  TYPE abap_bool
        RETURNING value(ro_specification) TYPE REF TO zif_specification,
      get_not_specification
        IMPORTING
          i_is_satisfied TYPE abap_bool
        RETURNING value(ro_specification) TYPE REF TO zif_specification.

ENDCLASS.                    "lcl_abstract_specification_tst DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_abstract_specification_tst IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS lcl_abstract_specification_tst IMPLEMENTATION.

  METHOD get_specification.

    CREATE OBJECT ro_specification
      TYPE zcl_test_specification
      EXPORTING
        i_is_satisfied = i_is_satisfied.

  ENDMETHOD.                    "get_specification

  METHOD get_and_specification.

    ro_specification =
      me->get_specification(
          i_is_satisfied_x
        )->and(
          me->get_specification( i_is_satisfied_y )
        ).

  ENDMETHOD.                    "get_and_specification

  METHOD get_or_specification.

    ro_specification =
      me->get_specification(
          i_is_satisfied_x
        )->or(
          me->get_specification( i_is_satisfied_y )
        ).

  ENDMETHOD.                    "GET_OR_SPECIFICATION

  METHOD get_not_specification.

    ro_specification =
      me->get_specification(
          i_is_satisfied
        )->not( ).

  ENDMETHOD.                    "GET_NOT_SPECIFICATION

ENDCLASS.                    "lcl_abstract_specification_tst IMPLEMENTATION


*----------------------------------------------------------------------*
*       CLASS ltcl_test_specification DEFINITION
*----------------------------------------------------------------------*
CLASS ltcl_test_specification DEFINITION
    INHERITING FROM lcl_abstract_specification_tst
    FOR TESTING
    DURATION SHORT
    RISK LEVEL HARMLESS
    FINAL.

  PRIVATE SECTION.

    METHODS:
      is_satisfied_yes  FOR TESTING,
      is_satisfied_no   FOR TESTING.

ENDCLASS.                    "ltcl_test_specification DEFINITION

*----------------------------------------------------------------------*
*       CLASS ltcl_test_specification IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS ltcl_test_specification IMPLEMENTATION.

  METHOD is_satisfied_yes.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_true
        act = me->get_specification( abap_true )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_satisfied_yes

  METHOD is_satisfied_no.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_false
        act = me->get_specification( abap_false )->is_satisfied_by( mo_null_object )
      ).

  ENDMETHOD.                    "is_satisfied_no

ENDCLASS.                    "ltcl_test_specification IMPLEMENTATION


*----------------------------------------------------------------------*
*       CLASS ltcl_test_and_specification DEFINITION
*----------------------------------------------------------------------*
CLASS ltcl_test_and_specification DEFINITION
    INHERITING FROM lcl_abstract_specification_tst
    FOR TESTING
    DURATION SHORT
    RISK LEVEL HARMLESS
    FINAL.

  PRIVATE SECTION.

    METHODS:
      is_stisfied_false_false__false FOR TESTING,
      is_stisfied_false_true__false  FOR TESTING,
      is_stisfied_true_false__false  FOR TESTING,
      is_stisfied_true_true__true    FOR TESTING.

ENDCLASS.                    "ltcl_test_and_specification DEFINITION

*----------------------------------------------------------------------*
*       CLASS ltcl_test_and_specification IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS ltcl_test_and_specification IMPLEMENTATION.

  METHOD is_stisfied_false_false__false.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_false
        act = me->get_and_specification(
                  i_is_satisfied_x = abap_false
                  i_is_satisfied_y = abap_false
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_false_false__false

  METHOD is_stisfied_false_true__false.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_false
        act = me->get_and_specification(
                  i_is_satisfied_x = abap_false
                  i_is_satisfied_y = abap_true
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_false_true__false

  METHOD is_stisfied_true_false__false.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_false
        act = me->get_and_specification(
                  i_is_satisfied_x = abap_true
                  i_is_satisfied_y = abap_false
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_true_false__false

  METHOD is_stisfied_true_true__true.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_true
        act = me->get_and_specification(
                  i_is_satisfied_x = abap_true
                  i_is_satisfied_y = abap_true
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_true_true__true

ENDCLASS.                    "ltcl_test_and_specification IMPLEMENTATION


*----------------------------------------------------------------------*
*       CLASS ltcl_test_or_specification DEFINITION
*----------------------------------------------------------------------*
CLASS ltcl_test_or_specification DEFINITION
    INHERITING FROM lcl_abstract_specification_tst
    FOR TESTING
    DURATION SHORT
    RISK LEVEL HARMLESS
    FINAL.

  PRIVATE SECTION.

    METHODS:
      is_stisfied_false_false__false FOR TESTING,
      is_stisfied_false_true__true   FOR TESTING,
      is_stisfied_true_false__true   FOR TESTING,
      is_stisfied_true_true__true    FOR TESTING.

ENDCLASS.                    "ltcl_test_or_specification DEFINITION

*----------------------------------------------------------------------*
*       CLASS ltcl_test_or_specification IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS ltcl_test_or_specification IMPLEMENTATION.

  METHOD is_stisfied_false_false__false.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_false
        act = me->get_or_specification(
                  i_is_satisfied_x = abap_false
                  i_is_satisfied_y = abap_false
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_false_false__false

  METHOD is_stisfied_false_true__true.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_true
        act = me->get_or_specification(
                  i_is_satisfied_x = abap_false
                  i_is_satisfied_y = abap_true
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_false_true__true

  METHOD is_stisfied_true_false__true.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_true
        act = me->get_or_specification(
                  i_is_satisfied_x = abap_true
                  i_is_satisfied_y = abap_false
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_true_false__true

  METHOD is_stisfied_true_true__true.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_true
        act = me->get_or_specification(
                  i_is_satisfied_x = abap_true
                  i_is_satisfied_y = abap_true
                )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_stisfied_true_true__true

ENDCLASS.                    "ltcl_test_or_specification IMPLEMENTATION


*----------------------------------------------------------------------*
*       CLASS ltcl_test_not_specification DEFINITION
*----------------------------------------------------------------------*
CLASS ltcl_test_not_specification DEFINITION
    INHERITING FROM lcl_abstract_specification_tst
    FOR TESTING
    DURATION SHORT
    RISK LEVEL HARMLESS
    FINAL.

  PRIVATE SECTION.

    METHODS:
      is_satisfied_not__true_false  FOR TESTING,
      is_satisfied_not__false_true FOR TESTING.

ENDCLASS.                    "ltcl_test_not_specification DEFINITION

*----------------------------------------------------------------------*
*       CLASS ltcl_test_not_specification IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS ltcl_test_not_specification IMPLEMENTATION.

  METHOD is_satisfied_not__true_false.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_false
        act = me->get_not_specification( abap_true )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_satisfied_not__true_false

  METHOD is_satisfied_not__false_true.

    cl_abap_unit_assert=>assert_equals(
        exp = abap_true
        act = me->get_not_specification( abap_false )->is_satisfied_by( me->mo_null_object )
      ).

  ENDMETHOD.                    "is_satisfied_not__false_false

ENDCLASS.                    "ltcl_test_not_specification IMPLEMENTATION