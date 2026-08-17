CLASS zcl_nm_demo_simple_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_NM_DEMO_SIMPLE_EML IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA:lt_selection TYPE TABLE FOR READ IMPORT Znm_I_RAPPartner,
         lt_creation  TYPE TABLE FOR CREATE Znm_I_RAPPartner,
         lt_update    TYPE TABLE FOR UPDATE Znm_I_RAPPartner.

    DATA:ls_failed   TYPE RESPONSE FOR FAILED EARLY znm_i_rappartner,
         ls_reported TYPE RESPONSE FOR REPORTED EARLY znm_i_rappartner,
         ls_mapped   TYPE RESPONSE FOR MAPPED EARLY znm_i_rappartner.

*    " Long form for selection (ALL FIELDS)
*
*    lt_selection = VALUE #(
*
*    ( PartnerNumber = '1000000001' )
*    ( PartnerNumber = '1000000003' )
*
*     ).
*
*
*    READ ENTITIES OF Znm_I_RAPPartner
*    ENTITY Partner
*
*    ALL FIELDS WITH lt_selection
*    RESULT DATA(lt_partner_long)
*    FAILED DATA(ls_failed)
*    REPORTED DATA(ls_reported).
*
*    out->write( lt_partner_long ).
*
*    " Short form for selection (SOME FIELDS)
*
*    READ ENTITIES OF Znm_I_RAPPartner
*
*    ENTITY Partner
*
*    FIELDS ( PartnerName Street City ) WITH VALUE #(
*
*    ( PartnerNumber = '1000000001' )
*        ( PartnerNumber = '1000000003' )
*
*     )
*
*     RESULT DATA(lt_partner_short)
*        FAILED ls_failed
*        REPORTED ls_reported.
*
*    out->write( lt_partner_short ).

    " Create new partner

*    lt_creation = VALUE #(
*
*    (
*       %cid = 'DummyKey1'
*       PartnerNumber = '1000000007'
*       PartnerName = 'Amazon'
*       Country = 'US'
*       %control-PartnerNumber = if_abap_behv=>mk-on
*       %control-PartnerName = if_abap_behv=>mk-on
*       %control-Country = if_abap_behv=>mk-on
*
*    ) ).
*
*    MODIFY ENTITIES OF Znm_I_RAPPartner
*    ENTITY Partner
*    CREATE FROM lt_creation
*    FAILED ls_failed
*    MAPPED ls_mapped
*    REPORTED ls_reported.
*
*    TRY.
*        out->write( ls_mapped-partner[ 1 ]-PartnerNumber ).
*        COMMIT ENTITIES.
*
*      CATCH cx_sy_itab_line_not_found.
*        out->write( ls_failed-partner[ 1 ]-%cid ).
*    ENDTRY.

    " Update partner

    lt_update = VALUE #(
      (
        PartnerNumber = '1000000007'
        PartnerName = 'Amazon Fake'
        City = 'Seattle'
        PaymentCurrency = 'USD'
        %control-PaymentCurrency = if_abap_behv=>mk-on
        %control-City = if_abap_behv=>mk-on
      )
    ).

    MODIFY ENTITIES OF Znm_I_RAPPartner ENTITY Partner

    UPDATE FROM lt_update
    FAILED ls_failed
        MAPPED ls_mapped
        REPORTED ls_reported.

    IF ls_failed-partner IS INITIAL.
      out->write( 'Updated' ).
      COMMIT ENTITIES.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
