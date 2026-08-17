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

      payment_currency as PaymentCurrency
}
