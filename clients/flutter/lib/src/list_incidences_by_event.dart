part of 'default.dart';

class ListIncidencesByEventVariablesBuilder {
  String eventId;

  final FirebaseDataConnect _dataConnect;
  ListIncidencesByEventVariablesBuilder(this._dataConnect, {required  this.eventId,});
  Deserializer<ListIncidencesByEventData> dataDeserializer = (dynamic json)  => ListIncidencesByEventData.fromJson(jsonDecode(json));
  Serializer<ListIncidencesByEventVariables> varsSerializer = (ListIncidencesByEventVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListIncidencesByEventData, ListIncidencesByEventVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListIncidencesByEventData, ListIncidencesByEventVariables> ref() {
    ListIncidencesByEventVariables vars= ListIncidencesByEventVariables(eventId: eventId,);
    return _dataConnect.query("ListIncidencesByEvent", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListIncidencesByEventIncidences {
  final String id;
  final String? eventId;
  final String? terminalEventId;
  final String? detail;
  final EnumValue<IncidenceSeverity> severity;
  final Timestamp date;
  final String? images;
  ListIncidencesByEventIncidences.fromJson(dynamic json):
  
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

    final ListIncidencesByEventIncidences otherTyped = other as ListIncidencesByEventIncidences;
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

  ListIncidencesByEventIncidences({
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
class ListIncidencesByEventData {
  final List<ListIncidencesByEventIncidences> incidences;
  ListIncidencesByEventData.fromJson(dynamic json):
  
  incidences = (json['incidences'] as List<dynamic>)
        .map((e) => ListIncidencesByEventIncidences.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListIncidencesByEventData otherTyped = other as ListIncidencesByEventData;
    return incidences == otherTyped.incidences;
    
  }
  @override
  int get hashCode => incidences.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['incidences'] = incidences.map((e) => e.toJson()).toList();
    return json;
  }

  ListIncidencesByEventData({
    required this.incidences,
  });
}

@immutable
class ListIncidencesByEventVariables {
  final String eventId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListIncidencesByEventVariables.fromJson(Map<String, dynamic> json):
  
  eventId = nativeFromJson<String>(json['eventId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListIncidencesByEventVariables otherTyped = other as ListIncidencesByEventVariables;
    return eventId == otherTyped.eventId;
    
  }
  @override
  int get hashCode => eventId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['eventId'] = nativeToJson<String>(eventId);
    return json;
  }

  ListIncidencesByEventVariables({
    required this.eventId,
  });
}

