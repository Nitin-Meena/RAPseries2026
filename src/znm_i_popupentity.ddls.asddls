@EndUserText.label: 'Entity for popup'
define abstract entity Znm_I_PopupEntity
{
  SearchCountry : land1;
  NewDate       : abap.dats;
  MessageType   : abap.int4;
  FlagUpdate    : abap.char(1);
  FlagMessage   : abap_boolean;

}
