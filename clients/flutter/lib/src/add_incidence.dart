part of 'default.dart';

class AddIncidenceVariablesBuilder {
  String id;
  Optional<String> _eventId = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _terminalEventId = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _detail = Optional.optional(nativeFromJson, nativeToJson);
  Optional<IncidenceSeverity> _severity = Optional.optional((data) => IncidenceSeverity.values.byName(data), enumSerializer);
  Timestamp date;
  Optional<String> _images = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  AddIncidenceVariablesBuilder eventId(String? t) {
   _eventId.value = t;
   return this;
  }
  AddIncidenceVariablesBuilder terminalEventId(String? t) {
   _terminalEventId.value = t;
   return this;
  }
  AddIncidenceVariablesBuilder detail(String? t) {
   _detail.value = t;
   return this;
  }
  AddIncidenceVariablesBuilder severity(IncidenceSeverity t) {
   _severity.value = t;
   return this;
  }
  AddIncidenceVariablesBuilder images(String? t) {
   _images.value = t;
   return this;
  }

  AddIncidenceVariablesBuilder(this._dataConnect, {required  this.id,required  this.date,});
  Deserializer<AddIncidenceData> dataDeserializer = (dynamic json)  => AddIncidenceData.fromJson(jsonDecode(json));
  Serializer<AddIncidenceVariables> varsSerializer = (AddIncidenceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddIncidenceData, AddIncidenceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddIncidenceData, AddIncidenceVariables> ref() {
    AddIncidenceVariables vars= AddIncidenceVariables(id: id,eventId: _eventId,terminalEventId: _terminalEventId,detail: _detail,severity: _severity,date: date,images: _images,);
    return _dataConnect.mutation("AddIncidence", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AddIncidenceIncidenceInsert {
  final String id;
  AddIncidenceIncidenceInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddIncidenceIncidenceInsert otherTyped = other as AddIncidenceIncidenceInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddIncidenceIncidenceInsert({
    required this.id,
  });
}

@immutable
class AddIncidenceData {
  final AddIncidenceIncidenceInsert incidence_insert;
  AddIncidenceData.fromJson(dynamic json):
  
  incidence_insert = AddIncidenceIncidenceInsert.fromJson(json['incidence_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddIncidenceData otherTyped = other as AddIncidenceData;
    return incidence_insert == otherTyped.incidence_insert;
    
  }
  @override
  int get hashCode => incidence_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['incidence_insert'] = incidence_insert.toJson();
    return json;
  }

  AddIncidenceData({
    required this.incidence_insert,
  });
}

@immutable
class AddIncidenceVariables {
  final String id;
  late final Optional<String>eventId;
  late final Optional<String>terminalEventId;
  late final Optional<String>detail;
  late final Optional<IncidenceSeverity>severity;
  final Timestamp date;
  late final Optional<String>images;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddIncidenceVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  date = Timestamp.fromJson(json['date']) {
  
  
  
    eventId = Optional.optional(nativeFromJson, nativeToJson);
    eventId.value = json['eventId'] == null ? null : nativeFromJson<String>(json['eventId']);
  
  
    terminalEventId = Optional.optional(nativeFromJson, nativeToJson);
    terminalEventId.value = json['terminalEventId'] == null ? null : nativeFromJson<String>(json['terminalEventId']);
  
  
    detail = Optional.optional(nativeFromJson, nativeToJson);
    detail.value = json['detail'] == null ? null : nativeFromJson<String>(json['detail']);
  
  
    severity = Optional.optional((data) => IncidenceSeverity.values.byName(data), enumSerializer);
    severity.value = json['severity'] == null ? null : IncidenceSeverity.values.byName(json['severity']);
  
  
  
    images = Optional.optional(nativeFromJson, nativeToJson);
    images.value = json['images'] == null ? null : nativeFromJson<String>(json['images']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddIncidenceVariables otherTyped = other as AddIncidenceVariables;
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
    if(eventId.state == OptionalState.set) {
      json['eventId'] = eventId.toJson();
    }
    if(terminalEventId.state == OptionalState.set) {
      json['terminalEventId'] = terminalEventId.toJson();
    }
    if(detail.state == OptionalState.set) {
      json['detail'] = detail.toJson();
    }
    if(severity.state == OptionalState.set) {
      json['severity'] = severity.toJson();
    }
    json['date'] = date.toJson();
    if(images.state == OptionalState.set) {
      json['images'] = images.toJson();
    }
    return json;
  }

  AddIncidenceVariables({
    required this.id,
    required this.eventId,
    required this.terminalEventId,
    required this.detail,
    required this.severity,
    required this.date,
    required this.images,
  });
}

