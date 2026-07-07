library vendeme_sqlconnect;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'upsert_ssid.dart';

part 'delete_ssid.dart';

part 'list_ssids.dart';

part 'ssid_by_ssid.dart';

part 'save_colacion_settings.dart';

part 'add_colacion_ticket.dart';

part 'get_colacion_settings.dart';

part 'list_colacion_tickets_by_month.dart';

part 'add_incidence.dart';

part 'delete_incidence.dart';

part 'list_incidences.dart';

part 'list_incidences_by_event.dart';

part 'get_incidence.dart';



  enum IncidenceSeverity {
    
      INFO,
    
      WARNING,
    
      CRITICAL,
    
  }
  
  String incidenceSeveritySerializer(EnumValue<IncidenceSeverity> e) {
    return e.stringValue;
  }
  EnumValue<IncidenceSeverity> incidenceSeverityDeserializer(dynamic data) {
    switch (data) {
      
      case 'INFO':
        return const Known(IncidenceSeverity.INFO);
      
      case 'WARNING':
        return const Known(IncidenceSeverity.WARNING);
      
      case 'CRITICAL':
        return const Known(IncidenceSeverity.CRITICAL);
      
      default:
        return Unknown(data);
    }
  }
  



String enumSerializer(Enum e) {
  return e.name;
}



/// A sealed class representing either a known enum value or an unknown string value.
@immutable
sealed class EnumValue<T extends Enum> {
  const EnumValue();

  

  /// The string representation of the value.
  String get stringValue;
  @override
  String toString() {
    return "EnumValue($stringValue)";
  }
}

/// Represents a known, valid enum value.
class Known<T extends Enum> extends EnumValue<T> {
  /// The actual enum value.
  final T value;

  const Known(this.value);

  @override
  String get stringValue => value.name;

  @override
  String toString() {
    return "Known($stringValue)";
  }
}
/// Represents an unknown or unrecognized enum value.
class Unknown extends EnumValue<Never> {
  /// The raw string value that couldn't be mapped to a known enum.
  @override
  final String stringValue;

  const Unknown(this.stringValue);
  @override
  String toString() {
    return "Unknown($stringValue)";
  }
}

class DefaultConnector {
  
  
  UpsertSsidVariablesBuilder upsertSsid ({required String id, required String ssid, required String password, }) {
    return UpsertSsidVariablesBuilder(dataConnect, id: id,ssid: ssid,password: password,);
  }
  
  
  DeleteSsidVariablesBuilder deleteSsid ({required String id, }) {
    return DeleteSsidVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListSsidsVariablesBuilder listSsids () {
    return ListSsidsVariablesBuilder(dataConnect, );
  }
  
  
  SsidBySsidVariablesBuilder ssidBySsid ({required String ssid, }) {
    return SsidBySsidVariablesBuilder(dataConnect, ssid: ssid,);
  }
  
  
  SaveColacionSettingsVariablesBuilder saveColacionSettings ({required int ticketPrice, required String companyName, }) {
    return SaveColacionSettingsVariablesBuilder(dataConnect, ticketPrice: ticketPrice,companyName: companyName,);
  }
  
  
  AddColacionTicketVariablesBuilder addColacionTicket ({required String id, required Timestamp date, required String month, required String employeeId, required String employeeName, required int ticketPrice, }) {
    return AddColacionTicketVariablesBuilder(dataConnect, id: id,date: date,month: month,employeeId: employeeId,employeeName: employeeName,ticketPrice: ticketPrice,);
  }
  
  
  GetColacionSettingsVariablesBuilder getColacionSettings () {
    return GetColacionSettingsVariablesBuilder(dataConnect, );
  }
  
  
  ListColacionTicketsByMonthVariablesBuilder listColacionTicketsByMonth ({required String month, }) {
    return ListColacionTicketsByMonthVariablesBuilder(dataConnect, month: month,);
  }
  
  
  AddIncidenceVariablesBuilder addIncidence ({required String id, required Timestamp date, }) {
    return AddIncidenceVariablesBuilder(dataConnect, id: id,date: date,);
  }
  
  
  DeleteIncidenceVariablesBuilder deleteIncidence ({required String id, }) {
    return DeleteIncidenceVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListIncidencesVariablesBuilder listIncidences () {
    return ListIncidencesVariablesBuilder(dataConnect, );
  }
  
  
  ListIncidencesByEventVariablesBuilder listIncidencesByEvent ({required String eventId, }) {
    return ListIncidencesByEventVariablesBuilder(dataConnect, eventId: eventId,);
  }
  
  
  GetIncidenceVariablesBuilder getIncidence ({required String id, }) {
    return GetIncidenceVariablesBuilder(dataConnect, id: id,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'default',
    'vendeme-sqlconnect',
  );

  DefaultConnector({required this.dataConnect});
  static DefaultConnector get instance {
    
    return DefaultConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
