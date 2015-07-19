interface ZIF_SPECIFICATION
  public .


  methods AND
    importing
      !IO_OTHER_SPECIFICATION type ref to ZIF_SPECIFICATION
    returning
      value(RO_SPECIFICATION) type ref to ZIF_SPECIFICATION .
  type-pools ABAP .
  methods IS_SATISFIED_BY
    importing
      !IO_OBJECT type ref to OBJECT
    returning
      value(R_IS) type ABAP_BOOL .
  methods NOT
    returning
      value(RO_SPECIFICATION) type ref to ZIF_SPECIFICATION .
  methods OR
    importing
      !IO_OTHER_SPECIFICATION type ref to ZIF_SPECIFICATION
    returning
      value(RO_SPECIFICATION) type ref to ZIF_SPECIFICATION .
endinterface.