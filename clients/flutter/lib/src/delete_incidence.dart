part of 'default.dart';

class DeleteIncidenceVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteIncidenceVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteIncidenceData> dataDeserializer = (dynamic json)  => DeleteIncidenceData.fromJson(jsonDecode(json));
  Serializer<DeleteIncidenceVariables> varsSerializer = (DeleteIncidenceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteIncidenceData, DeleteIncidenceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteIncidenceData, DeleteIncidenceVariables> ref() {
    DeleteIncidenceVariables vars= DeleteIncidenceVariables(id: id,);
    return _dataConnect.mutation("DeleteIncidence", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class DeleteIncidenceIncidenceDelete {
  final String id;
  DeleteIncidenceIncidenceDelete.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteIncidenceIncidenceDelete otherTyped = other as DeleteIncidenceIncidenceDelete;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteIncidenceIncidenceDelete({
    required this.id,
  });
}

@immutable
class DeleteIncidenceData {
  final DeleteIncidenceIncidenceDelete? incidence_delete;
  DeleteIncidenceData.fromJson(dynamic json):
  
  incidence_delete = json['incidence_delete'] == null ? null : DeleteIncidenceIncidenceDelete.fromJson(json['incidence_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteIncidenceData otherTyped = other as DeleteIncidenceData;
    return incidence_delete == otherTyped.incidence_delete;
    
  }
  @override
  int get hashCode => incidence_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (incidence_delete != null) {
      json['incidence_delete'] = incidence_delete!.toJson();
    }
    return json;
  }

  DeleteIncidenceData({
    this.incidence_delete,
  });
}

@immutable
class DeleteIncidenceVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteIncidenceVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteIncidenceVariables otherTyped = other as DeleteIncidenceVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteIncidenceVariables({
    required this.id,
  });
}

