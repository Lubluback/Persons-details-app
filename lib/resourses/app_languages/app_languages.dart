import 'package:get/get.dart';

class LocaleLanguages extends Translations {
  @override
  
  Map<String, Map<String, String>> get keys => {
    
    "en_US": {
      'fullname':'Full Name',
      'phonenumber':'Phone Number',
      'email':'Email',
      'occupation':'Occupation',
      'city':'City',
      'state':'State',
      'save':'Save',

  },
  "ml_IN":{
      'fullname':'പൂർണ്ണമായ പേര്',
      'phonenumber':'ഫോൺ നമ്പർ',
      'email':'ഇമെയിൽ',
      'occupation':'തൊഴിൽ',
      'city':'നഗരം',
      'state':'സംസ്ഥാനം',
      'save':'സംഭരിക്കുക',
  }
  };
}
