part of 'default.dart';

class GetColacionSettingsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetColacionSettingsVariablesBuilder(this._dataConnect, );
  Deserializer<GetColacionSettingsData> dataDeserializer = (dynamic json)  => GetColacionSettingsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetColacionSettingsData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetColacionSettingsData, void> ref() {
    
    return _dataConnect.query("GetColacionSettings", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class GetColacionSettingsColacionSetting {
  final int ticketPrice;
  final String companyName;
  final String? companyRut;
  final String? companyPhone;
  final String? companyEmail;
  GetColacionSettingsColacionSetting.fromJson(dynamic json):
  
  ticketPrice = nativeFromJson<int>(json['ticketPrice']),
  companyName = nativeFromJson<String>(json['companyName']),
  companyRut = json['companyRut'] == null ? null : nativeFromJson<String>(json['companyRut']),
  companyPhone = json['companyPhone'] == null ? null : nativeFromJson<String>(json['companyPhone']),
  companyEmail = json['companyEmail'] == null ? null : nativeFromJson<String>(json['companyEmail']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetColacionSettingsColacionSetting otherTyped = other as GetColacionSettingsColacionSetting;
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
    if (companyRut != null) {
      json['companyRut'] = nativeToJson<String?>(companyRut);
    }
    if (companyPhone != null) {
      json['companyPhone'] = nativeToJson<String?>(companyPhone);
    }
    if (companyEmail != null) {
      json['companyEmail'] = nativeToJson<String?>(companyEmail);
    }
    return json;
  }

  GetColacionSettingsColacionSetting({
    required this.ticketPrice,
    required this.companyName,
    this.companyRut,
    this.companyPhone,
    this.companyEmail,
  });
}

@immutable
class GetColacionSettingsData {
  final GetColacionSettingsColacionSetting? colacionSetting;
  GetColacionSettingsData.fromJson(dynamic json):
  
  colacionSetting = json['colacionSetting'] == null ? null : GetColacionSettingsColacionSetting.fromJson(json['colacionSetting']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetColacionSettingsData otherTyped = other as GetColacionSettingsData;
    return colacionSetting == otherTyped.colacionSetting;
    
  }
  @override
  int get hashCode => colacionSetting.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (colacionSetting != null) {
      json['colacionSetting'] = colacionSetting!.toJson();
    }
    return json;
  }

  GetColacionSettingsData({
    this.colacionSetting,
  });
}

