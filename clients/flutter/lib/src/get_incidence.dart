part of 'default.dart';

class GetIncidenceVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  GetIncidenceVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<GetIncidenceData> dataDeserializer = (dynamic json)  => GetIncidenceData.fromJson(jsonDecode(json));
  Serializer<GetIncidenceVariables> varsSerializer = (GetIncidenceVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetIncidenceData, GetIncidenceVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetIncidenceData, GetIncidenceVariables> ref() {
    GetIncidenceVariables vars= GetIncidenceVariables(id: id,);
    return _dataConnect.query("GetIncidence", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetIncidenceIncidence {
  final String id;
  final String? eventId;
  final String? terminalEventId;
  final String? detail;
  final EnumValue<IncidenceSeverity> severity;
  final Timestamp date;
  final String? images;
  GetIncidenceIncidence.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  eventId = json['eventId'] == null ? null : nativeFromJson<String>(json['eventId']),
  terminalEventId = json['terminalEventId'] == null ? null : nativeFromJson<String>(json['terminalEventId']),
  detail = json['detail'] == null ? null : nativeFromJson<String>(json['detail']),
  severity = incidenceSeverityDeserializer(json['severity']),
  date = Timestamp.fromJson(json['date']),
  images = json['images'] == null ? null : nativeFromJson<String>(json['images']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetIncidenceIncidence otherTyped = other as GetIncidenceIncidence;
    return id == otherTyped.id && 
    eventId == otherTyped.eventId && 
    terminalEventId == otherTyped.terminalEventId && 
    detail == otherTyped.detail && 
    severity == otherTyped.severity && 
    date == otherTyped.date && 
    images == otherTyped.images;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, eventId.hashCode, terminalEventId.hashCode, detail.hashCode, severity.hashCode, date.hashCode, images.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if (eventId != null) {
      json['eventId'] = nativeToJson<String?>(eventId);
    }
    if (terminalEventId != null) {
      json['terminalEventId'] = nativeToJson<String?>(terminalEventId);
    }
    if (detail != null) {
      json['detail'] = nativeToJson<String?>(detail);
    }
    json['severity'] = 
    incidenceSeveritySerializer(severity)
    ;
    json['date'] = date.toJson();
    if (images != null) {
      json['images'] = nativeToJson<String?>(images);
    }
    return json;
  }

  GetIncidenceIncidence({
    required this.id,
    this.eventId,
    this.terminalEventId,
    this.detail,
    required this.severity,
    required this.date,
    this.images,
  });
}

@immutable
class GetIncidenceData {
  final GetIncidenceIncidence? incidence;
  GetIncidenceData.fromJson(dynamic json):
  
  incidence = json['incidence'] == null ? null : GetIncidenceIncidence.fromJson(json['incidence']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetIncidenceData otherTyped = other as GetIncidenceData;
    return incidence == otherTyped.incidence;
    
  }
  @override
  int get hashCode => incidence.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (incidence != null) {
      json['incidence'] = incidence!.toJson();
    }
    return json;
  }

  GetIncidenceData({
    this.incidence,
  });
}

@immutable
class GetIncidenceVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetIncidenceVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetIncidenceVariables otherTyped = other as GetIncidenceVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetIncidenceVariables({
    required this.id,
  });
}

