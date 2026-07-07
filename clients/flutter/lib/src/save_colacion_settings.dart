part of 'default.dart';

class SaveColacionSettingsVariablesBuilder {
  int ticketPrice;
  String companyName;
  Optional<String> _companyRut = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _companyPhone = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _companyEmail = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  SaveColacionSettingsVariablesBuilder companyRut(String? t) {
   _companyRut.value = t;
   return this;
  }
  SaveColacionSettingsVariablesBuilder companyPhone(String? t) {
   _companyPhone.value = t;
   return this;
  }
  SaveColacionSettingsVariablesBuilder companyEmail(String? t) {
   _companyEmail.value = t;
   return this;
  }

  SaveColacionSettingsVariablesBuilder(this._dataConnect, {required  this.ticketPrice,required  this.companyName,});
  Deserializer<SaveColacionSettingsData> dataDeserializer = (dynamic json)  => SaveColacionSettingsData.fromJson(jsonDecode(json));
  Serializer<SaveColacionSettingsVariables> varsSerializer = (SaveColacionSettingsVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<SaveColacionSettingsData, SaveColacionSettingsVariables>> execute() {
    return ref().execute();
  }

  MutationRef<SaveColacionSettingsData, SaveColacionSettingsVariables> ref() {
    SaveColacionSettingsVariables vars= SaveColacionSettingsVariables(ticketPrice: ticketPrice,companyName: companyName,companyRut: _companyRut,companyPhone: _companyPhone,companyEmail: _companyEmail,);
    return _dataConnect.mutation("SaveColacionSettings", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SaveColacionSettingsColacionSettingUpsert {
  final String id;
  SaveColacionSettingsColacionSettingUpsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SaveColacionSettingsColacionSettingUpsert otherTyped = other as SaveColacionSettingsColacionSettingUpsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  SaveColacionSettingsColacionSettingUpsert({
    required this.id,
  });
}

@immutable
class SaveColacionSettingsData {
  final SaveColacionSettingsColacionSettingUpsert colacionSetting_upsert;
  SaveColacionSettingsData.fromJson(dynamic json):
  
  colacionSetting_upsert = SaveColacionSettingsColacionSettingUpsert.fromJson(json['colacionSetting_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SaveColacionSettingsData otherTyped = other as SaveColacionSettingsData;
    return colacionSetting_upsert == otherTyped.colacionSetting_upsert;
    
  }
  @override
  int get hashCode => colacionSetting_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['colacionSetting_upsert'] = colacionSetting_upsert.toJson();
    return json;
  }

  SaveColacionSettingsData({
    required this.colacionSetting_upsert,
  });
}

@immutable
class SaveColacionSettingsVariables {
  final int ticketPrice;
  final String companyName;
  late final Optional<String>companyRut;
  late final Optional<String>companyPhone;
  late final Optional<String>companyEmail;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SaveColacionSettingsVariables.fromJson(Map<String, dynamic> json):
  
  ticketPrice = nativeFromJson<int>(json['ticketPrice']),
  companyName = nativeFromJson<String>(json['companyName']) {
  
  
  
  
    companyRut = Optional.optional(nativeFromJson, nativeToJson);
    companyRut.value = json['companyRut'] == null ? null : nativeFromJson<String>(json['companyRut']);
  
  
    companyPhone = Optional.optional(nativeFromJson, nativeToJson);
    companyPhone.value = json['companyPhone'] == null ? null : nativeFromJson<String>(json['companyPhone']);
  
  
    companyEmail = Optional.optional(nativeFromJson, nativeToJson);
    companyEmail.value = json['companyEmail'] == null ? null : nativeFromJson<String>(json['companyEmail']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SaveColacionSettingsVariables otherTyped = other as SaveColacionSettingsVariables;
    return ticketPrice == otherTyped.ticketPrice && 
    companyName == otherTyped.companyName && 
    companyRut == otherTyped.companyRut && 
    companyPhone == otherTyped.companyPhone && 
    companyEmail == otherTyped.companyEmail;
    
  }
  @override
  int get hashCode => Object.hashAll([ticketPrice.hashCode, companyName.hashCode, companyRut.hashCode, companyPhone.hashCode, companyEmail.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['ticketPrice'] = nativeToJson<int>(ticketPrice);
    json['companyName'] = nativeToJson<String>(companyName);
    if(companyRut.state == OptionalState.set) {
      json['companyRut'] = companyRut.toJson();
    }
    if(companyPhone.state == OptionalState.set) {
      json['companyPhone'] = companyPhone.toJson();
    }
    if(companyEmail.state == OptionalState.set) {
      json['companyEmail'] = companyEmail.toJson();
    }
    return json;
  }

  SaveColacionSettingsVariables({
    required this.ticketPrice,
    required this.companyName,
    required this.companyRut,
    required this.companyPhone,
    required this.companyEmail,
  });
}

