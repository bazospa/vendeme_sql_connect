part of 'default.dart';

class UpsertSsidVariablesBuilder {
  String id;
  String ssid;
  String password;

  final FirebaseDataConnect _dataConnect;
  UpsertSsidVariablesBuilder(this._dataConnect, {required  this.id,required  this.ssid,required  this.password,});
  Deserializer<UpsertSsidData> dataDeserializer = (dynamic json)  => UpsertSsidData.fromJson(jsonDecode(json));
  Serializer<UpsertSsidVariables> varsSerializer = (UpsertSsidVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertSsidData, UpsertSsidVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertSsidData, UpsertSsidVariables> ref() {
    UpsertSsidVariables vars= UpsertSsidVariables(id: id,ssid: ssid,password: password,);
    return _dataConnect.mutation("UpsertSsid", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpsertSsidSsidUpsert {
  final String id;
  UpsertSsidSsidUpsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertSsidSsidUpsert otherTyped = other as UpsertSsidSsidUpsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertSsidSsidUpsert({
    required this.id,
  });
}

@immutable
class UpsertSsidData {
  final UpsertSsidSsidUpsert ssid_upsert;
  UpsertSsidData.fromJson(dynamic json):
  
  ssid_upsert = UpsertSsidSsidUpsert.fromJson(json['ssid_upsert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertSsidData otherTyped = other as UpsertSsidData;
    return ssid_upsert == otherTyped.ssid_upsert;
    
  }
  @override
  int get hashCode => ssid_upsert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['ssid_upsert'] = ssid_upsert.toJson();
    return json;
  }

  UpsertSsidData({
    required this.ssid_upsert,
  });
}

@immutable
class UpsertSsidVariables {
  final String id;
  final String ssid;
  final String password;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertSsidVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  ssid = nativeFromJson<String>(json['ssid']),
  password = nativeFromJson<String>(json['password']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpsertSsidVariables otherTyped = other as UpsertSsidVariables;
    return id == otherTyped.id && 
    ssid == otherTyped.ssid && 
    password == otherTyped.password;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, ssid.hashCode, password.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['ssid'] = nativeToJson<String>(ssid);
    json['password'] = nativeToJson<String>(password);
    return json;
  }

  UpsertSsidVariables({
    required this.id,
    required this.ssid,
    required this.password,
  });
}

