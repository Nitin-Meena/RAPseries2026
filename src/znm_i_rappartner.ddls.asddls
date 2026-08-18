@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP interface for Partner'
//@Metadata.allowExtensions: true
define root view entity Znm_I_RAPPartner
  as select from znm_dmo_partner
{

  key partner          as PartnerNumber,

      name             as PartnerName,

      street           as Street,

      city             as City,

      country          as Country,

      payment_currency as PaymentCurrency,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at  as LastChangedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by  as LastChangedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at       as CreatedAt,
      @Semantics.user.createdBy: true
      created_by       as CreatedBy
}
