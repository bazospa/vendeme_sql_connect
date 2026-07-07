part of 'default.dart';

class AddColacionTicketVariablesBuilder {
  String id;
  Optional<String> _type = Optional.optional(nativeFromJson, nativeToJson);
  Timestamp date;
  String month;
  String employeeId;
  String employeeName;
  Optional<String> _employeeRut = Optional.optional(nativeFromJson, nativeToJson);
  int ticketPrice;

  final FirebaseDataConnect _dataConnect;  AddColacionTicketVariablesBuilder type(String t) {
   _type.value = t;
   return this;
  }
  AddColacionTicketVariablesBuilder employeeRut(String? t) {
   _employeeRut.value = t;
   return this;
  }

  AddColacionTicketVariablesBuilder(this._dataConnect, {required  this.id,required  this.date,required  this.month,required  this.employeeId,required  this.employeeName,required  this.ticketPrice,});
  Deserializer<AddColacionTicketData> dataDeserializer = (dynamic json)  => AddColacionTicketData.fromJson(jsonDecode(json));
  Serializer<AddColacionTicketVariables> varsSerializer = (AddColacionTicketVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<AddColacionTicketData, AddColacionTicketVariables>> execute() {
    return ref().execute();
  }

  MutationRef<AddColacionTicketData, AddColacionTicketVariables> ref() {
    AddColacionTicketVariables vars= AddColacionTicketVariables(id: id,type: _type,date: date,month: month,employeeId: employeeId,employeeName: employeeName,employeeRut: _employeeRut,ticketPrice: ticketPrice,);
    return _dataConnect.mutation("AddColacionTicket", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class AddColacionTicketColacionTicketInsert {
  final String id;
  AddColacionTicketColacionTicketInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddColacionTicketColacionTicketInsert otherTyped = other as AddColacionTicketColacionTicketInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  AddColacionTicketColacionTicketInsert({
    required this.id,
  });
}

@immutable
class AddColacionTicketData {
  final AddColacionTicketColacionTicketInsert colacionTicket_insert;
  AddColacionTicketData.fromJson(dynamic json):
  
  colacionTicket_insert = AddColacionTicketColacionTicketInsert.fromJson(json['colacionTicket_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddColacionTicketData otherTyped = other as AddColacionTicketData;
    return colacionTicket_insert == otherTyped.colacionTicket_insert;
    
  }
  @override
  int get hashCode => colacionTicket_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['colacionTicket_insert'] = colacionTicket_insert.toJson();
    return json;
  }

  AddColacionTicketData({
    required this.colacionTicket_insert,
  });
}

@immutable
class AddColacionTicketVariables {
  final String id;
  late final Optional<String>type;
  final Timestamp date;
  final String month;
  final String employeeId;
  final String employeeName;
  late final Optional<String>employeeRut;
  final int ticketPrice;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  AddColacionTicketVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  date = Timestamp.fromJson(json['date']),
  month = nativeFromJson<String>(json['month']),
  employeeId = nativeFromJson<String>(json['employeeId']),
  employeeName = nativeFromJson<String>(json['employeeName']),
  ticketPrice = nativeFromJson<int>(json['ticketPrice']) {
  
  
  
    type = Optional.optional(nativeFromJson, nativeToJson);
    type.value = json['type'] == null ? null : nativeFromJson<String>(json['type']);
  
  
  
  
  
  
    employeeRut = Optional.optional(nativeFromJson, nativeToJson);
    employeeRut.value = json['employeeRut'] == null ? null : nativeFromJson<String>(json['employeeRut']);
  
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final AddColacionTicketVariables otherTyped = other as AddColacionTicketVariables;
    return id == otherTyped.id && 
    type == otherTyped.type && 
    date == otherTyped.date && 
    month == otherTyped.month && 
    employeeId == otherTyped.employeeId && 
    employeeName == otherTyped.employeeName && 
    employeeRut == otherTyped.employeeRut && 
    ticketPrice == otherTyped.ticketPrice;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, type.hashCode, date.hashCode, month.hashCode, employeeId.hashCode, employeeName.hashCode, employeeRut.hashCode, ticketPrice.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if(type.state == OptionalState.set) {
      json['type'] = type.toJson();
    }
    json['date'] = date.toJson();
    json['month'] = nativeToJson<String>(month);
    json['employeeId'] = nativeToJson<String>(employeeId);
    json['employeeName'] = nativeToJson<String>(employeeName);
    if(employeeRut.state == OptionalState.set) {
      json['employeeRut'] = employeeRut.toJson();
    }
    json['ticketPrice'] = nativeToJson<int>(ticketPrice);
    return json;
  }

  AddColacionTicketVariables({
    required this.id,
    required this.type,
    required this.date,
    required this.month,
    required this.employeeId,
    required this.employeeName,
    required this.employeeRut,
    required this.ticketPrice,
  });
}

