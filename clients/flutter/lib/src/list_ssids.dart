part of 'default.dart';

class ListSsidsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListSsidsVariablesBuilder(this._dataConnect, );
  Deserializer<ListSsidsData> dataDeserializer = (dynamic json)  => ListSsidsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListSsidsData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListSsidsData, void> ref() {
    
    return _dataConnect.query("ListSsids", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListSsidsSsids {
  final String id;
  final String ssid;
  final String password;
  final Timestamp updatedAt;
  ListSsidsSsids.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  ssid = nativeFromJson<String>(json['ssid']),
  password = nativeFromJson<String>(json['password']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSsidsSsids otherTyped = other as ListSsidsSsids;
    return id == otherTyped.id && 
    ssid == otherTyped.ssid && 
    password == otherTyped.password && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, ssid.hashCode, password.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['ssid'] = nativeToJson<String>(ssid);
    json['password'] = nativeToJson<String>(password);
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  ListSsidsSsids({
    required this.id,
    required this.ssid,
    required this.password,
    required this.updatedAt,
  });
}

@immutable
class ListSsidsData {
  final List<ListSsidsSsids> ssids;
  ListSsidsData.fromJson(dynamic json):
  
  ssids = (json['ssids'] as List<dynamic>)
        .map((e) => ListSsidsSsids.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListSsidsData otherTyped = other as ListSsidsData;
    return ssids == otherTyped.ssids;
    
  }
  @override
  int get hashCode => ssids.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['ssids'] = ssids.map((e) => e.toJson()).toList();
    return json;
  }

  ListSsidsData({
    required this.ssids,
  });
}

