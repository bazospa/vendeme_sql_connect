part of 'default.dart';

class DeleteSsidVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteSsidVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteSsidData> dataDeserializer = (dynamic json)  => DeleteSsidData.fromJson(jsonDecode(json));
  Serializer<DeleteSsidVariables> varsSerializer = (DeleteSsidVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteSsidData, DeleteSsidVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteSsidData, DeleteSsidVariables> ref() {
    DeleteSsidVariables vars= DeleteSsidVariables(id: id,);
    return _dataConnect.mutation("DeleteSsid", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class DeleteSsidSsidDelete {
  final String id;
  DeleteSsidSsidDelete.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteSsidSsidDelete otherTyped = other as DeleteSsidSsidDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteSsidSsidDelete({
    required this.id,
  });
}

@immutable
class DeleteSsidData {
  final DeleteSsidSsidDelete? ssid_delete;
  DeleteSsidData.fromJson(dynamic json):
  
  ssid_delete = json['ssid_delete'] == null ? null : DeleteSsidSsidDelete.fromJson(json['ssid_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteSsidData otherTyped = other as DeleteSsidData;
    return ssid_delete == otherTyped.ssid_delete;
    
  }
  @override
  int get hashCode => ssid_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (ssid_delete != null) {
      json['ssid_delete'] = ssid_delete!.toJson();
    }
    return json;
  }

  DeleteSsidData({
    this.ssid_delete,
  });
}

@immutable
class DeleteSsidVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteSsidVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteSsidVariables otherTyped = other as DeleteSsidVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteSsidVariables({
    required this.id,
  });
}

