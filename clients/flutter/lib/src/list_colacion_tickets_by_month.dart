part of 'default.dart';

class ListColacionTicketsByMonthVariablesBuilder {
  String month;

  final FirebaseDataConnect _dataConnect;
  ListColacionTicketsByMonthVariablesBuilder(this._dataConnect, {required  this.month,});
  Deserializer<ListColacionTicketsByMonthData> dataDeserializer = (dynamic json)  => ListColacionTicketsByMonthData.fromJson(jsonDecode(json));
  Serializer<ListColacionTicketsByMonthVariables> varsSerializer = (ListColacionTicketsByMonthVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListColacionTicketsByMonthData, ListColacionTicketsByMonthVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListColacionTicketsByMonthData, ListColacionTicketsByMonthVariables> ref() {
    ListColacionTicketsByMonthVariables vars= ListColacionTicketsByMonthVariables(month: month,);
    return _dataConnect.query("ListColacionTicketsByMonth", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class ListColacionTicketsByMonthColacionTickets {
  final String id;
  final String type;
  final Timestamp date;
  final String month;
  final String employeeId;
  final String employeeName;
  final String? employeeRut;
  final int ticketPrice;
  ListColacionTicketsByMonthColacionTickets.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  type = nativeFromJson<String>(json['type']),
  date = Timestamp.fromJson(json['date']),
  month = nativeFromJson<String>(json['month']),
  employeeId = nativeFromJson<String>(json['employeeId']),
  employeeName = nativeFromJson<String>(json['employeeName']),
  employeeRut = json['employeeRut'] == null ? null : nativeFromJson<String>(json['employeeRut']),
  ticketPrice = nativeFromJson<int>(json['ticketPrice']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListColacionTicketsByMonthColacionTickets otherTyped = other as ListColacionTicketsByMonthColacionTickets;
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
    json['type'] = nativeToJson<String>(type);
    json['date'] = date.toJson();
    json['month'] = nativeToJson<String>(month);
    json['employeeId'] = nativeToJson<String>(employeeId);
    json['employeeName'] = nativeToJson<String>(employeeName);
    if (employeeRut != null) {
      json['employeeRut'] = nativeToJson<String?>(employeeRut);
    }
    json['ticketPrice'] = nativeToJson<int>(ticketPrice);
    return json;
  }

  ListColacionTicketsByMonthColacionTickets({
    required this.id,
    required this.type,
    required this.date,
    required this.month,
    required this.employeeId,
    required this.employeeName,
    this.employeeRut,
    required this.ticketPrice,
  });
}

@immutable
class ListColacionTicketsByMonthData {
  final List<ListColacionTicketsByMonthColacionTickets> colacionTickets;
  ListColacionTicketsByMonthData.fromJson(dynamic json):
  
  colacionTickets = (json['colacionTickets'] as List<dynamic>)
        .map((e) => ListColacionTicketsByMonthColacionTickets.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListColacionTicketsByMonthData otherTyped = other as ListColacionTicketsByMonthData;
    return colacionTickets == otherTyped.colacionTickets;
    
  }
  @override
  int get hashCode => colacionTickets.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['colacionTickets'] = colacionTickets.map((e) => e.toJson()).toList();
    return json;
  }

  ListColacionTicketsByMonthData({
    required this.colacionTickets,
  });
}

@immutable
class ListColacionTicketsByMonthVariables {
  final String month;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListColacionTicketsByMonthVariables.fromJson(Map<String, dynamic> json):
  
  month = nativeFromJson<String>(json['month']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListColacionTicketsByMonthVariables otherTyped = other as ListColacionTicketsByMonthVariables;
    return month == otherTyped.month;
    
  }
  @override
  int get hashCode => month.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['month'] = nativeToJson<String>(month);
    return json;
  }

  ListColacionTicketsByMonthVariables({
    required this.month,
  });
}

