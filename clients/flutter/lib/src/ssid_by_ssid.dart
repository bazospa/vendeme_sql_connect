part of 'default.dart';

class SsidBySsidVariablesBuilder {
  String ssid;

  final FirebaseDataConnect _dataConnect;
  SsidBySsidVariablesBuilder(this._dataConnect, {required  this.ssid,});
  Deserializer<SsidBySsidData> dataDeserializer = (dynamic json)  => SsidBySsidData.fromJson(jsonDecode(json));
  Serializer<SsidBySsidVariables> varsSerializer = (SsidBySsidVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<SsidBySsidData, SsidBySsidVariables>> execute() {
    return ref().execute();
  }

  QueryRef<SsidBySsidData, SsidBySsidVariables> ref() {
    SsidBySsidVariables vars= SsidBySsidVariables(ssid: ssid,);
    return _dataConnect.query("SsidBySsid", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class SsidBySsidSsids {
  final String id;
  SsidBySsidSsids.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SsidBySsidSsids otherTyped = other as SsidBySsidSsids;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  SsidBySsidSsids({
    required this.id,
  });
}

@immutable
class SsidBySsidData {
  final List<SsidBySsidSsids> ssids;
  SsidBySsidData.fromJson(dynamic json):
  
  ssids = (json['ssids'] as List<dynamic>)
        .map((e) => SsidBySsidSsids.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SsidBySsidData otherTyped = other as SsidBySsidData;
    return ssids == otherTyped.ssids;
    
  }
  @override
  int get hashCode => ssids.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['ssids'] = ssids.map((e) => e.toJson()).toList();
    return json;
  }

  SsidBySsidData({
    required this.ssids,
  });
}

@immutable
class SsidBySsidVariables {
  final String ssid;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  SsidBySsidVariables.fromJson(Map<String, dynamic> json):
  
  ssid = nativeFromJson<String>(json['ssid']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final SsidBySsidVariables otherTyped = other as SsidBySsidVariables;
    return ssid == otherTyped.ssid;
    
  }
  @override
  int get hashCode => ssid.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['ssid'] = nativeToJson<String>(ssid);
    return json;
  }

  SsidBySsidVariables({
    required this.ssid,
  });
}

