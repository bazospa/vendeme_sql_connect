part of 'default.dart';

class ListIncidencesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListIncidencesVariablesBuilder(this._dataConnect, );
  Deserializer<ListIncidencesData> dataDeserializer = (dynamic json)  => ListIncidencesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListIncidencesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListIncidencesData, void> ref() {
    
    return _dataConnect.query("ListIncidences", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListIncidencesIncidences {
  final String id;
  final String? eventId;
  final String? terminalEventId;
  final String? detail;
  final EnumValue<IncidenceSeverity> severity;
  final Timestamp date;
  final String? images;
  ListIncidencesIncidences.fromJson(dynamic json):
  
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

    final ListIncidencesIncidences otherTyped = other as ListIncidencesIncidences;
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

  ListIncidencesIncidences({
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
class ListIncidencesData {
  final List<ListIncidencesIncidences> incidences;
  ListIncidencesData.fromJson(dynamic json):
  
  incidences = (json['incidences'] as List<dynamic>)
        .map((e) => ListIncidencesIncidences.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListIncidencesData otherTyped = other as ListIncidencesData;
    return incidences == otherTyped.incidences;
    
  }
  @override
  int get hashCode => incidences.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['incidences'] = incidences.map((e) => e.toJson()).toList();
    return json;
  }

  ListIncidencesData({
    required this.incidences,
  });
}

