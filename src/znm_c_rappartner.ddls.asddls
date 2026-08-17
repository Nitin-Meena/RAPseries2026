@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP consumption for partner'
@Metadata.allowExtensions: true
define root view entity ZNM_C_RAPPartner
  provider contract transactional_query
  as projection on Znm_I_RAPPartner


{
  key PartnerNumber,
      PartnerName,
      Street,
      City,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZNM_C_CountryVH', element: 'Country' } }]
      Country,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      PaymentCurrency
}
