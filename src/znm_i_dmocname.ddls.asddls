@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo Company name view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZNM_I_DmoCName
  as select from zbs_dmo_cname
{
  key name        as CompanyName,
      branch      as Branch,
      description as CompanyDescription
}
