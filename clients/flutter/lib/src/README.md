# vendeme_sqlconnect SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
DefaultConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### ListSsids
#### Required Arguments
```dart
// No required arguments
DefaultConnector.instance.listSsids().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListSsidsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.listSsids();
ListSsidsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DefaultConnector.instance.listSsids().ref();
ref.execute();

ref.subscribe(...);
```


### SsidBySsid
#### Required Arguments
```dart
String ssid = ...;
DefaultConnector.instance.ssidBySsid(
  ssid: ssid,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<SsidBySsidData, SsidBySsidVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.ssidBySsid(
  ssid: ssid,
);
SsidBySsidData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String ssid = ...;

final ref = DefaultConnector.instance.ssidBySsid(
  ssid: ssid,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetColacionSettings
#### Required Arguments
```dart
// No required arguments
DefaultConnector.instance.getColacionSettings().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetColacionSettingsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.getColacionSettings();
GetColacionSettingsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DefaultConnector.instance.getColacionSettings().ref();
ref.execute();

ref.subscribe(...);
```


### ListColacionTicketsByMonth
#### Required Arguments
```dart
String month = ...;
DefaultConnector.instance.listColacionTicketsByMonth(
  month: month,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListColacionTicketsByMonthData, ListColacionTicketsByMonthVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.listColacionTicketsByMonth(
  month: month,
);
ListColacionTicketsByMonthData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String month = ...;

final ref = DefaultConnector.instance.listColacionTicketsByMonth(
  month: month,
).ref();
ref.execute();

ref.subscribe(...);
```


### ListIncidences
#### Required Arguments
```dart
// No required arguments
DefaultConnector.instance.listIncidences().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListIncidencesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.listIncidences();
ListIncidencesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = DefaultConnector.instance.listIncidences().ref();
ref.execute();

ref.subscribe(...);
```


### ListIncidencesByEvent
#### Required Arguments
```dart
String eventId = ...;
DefaultConnector.instance.listIncidencesByEvent(
  eventId: eventId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListIncidencesByEventData, ListIncidencesByEventVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.listIncidencesByEvent(
  eventId: eventId,
);
ListIncidencesByEventData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String eventId = ...;

final ref = DefaultConnector.instance.listIncidencesByEvent(
  eventId: eventId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetIncidence
#### Required Arguments
```dart
String id = ...;
DefaultConnector.instance.getIncidence(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetIncidenceData, GetIncidenceVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await DefaultConnector.instance.getIncidence(
  id: id,
);
GetIncidenceData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = DefaultConnector.instance.getIncidence(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### UpsertSsid
#### Required Arguments
```dart
String id = ...;
String ssid = ...;
String password = ...;
DefaultConnector.instance.upsertSsid(
  id: id,
  ssid: ssid,
  password: password,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpsertSsidData, UpsertSsidVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.upsertSsid(
  id: id,
  ssid: ssid,
  password: password,
);
UpsertSsidData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String ssid = ...;
String password = ...;

final ref = DefaultConnector.instance.upsertSsid(
  id: id,
  ssid: ssid,
  password: password,
).ref();
ref.execute();
```


### DeleteSsid
#### Required Arguments
```dart
String id = ...;
DefaultConnector.instance.deleteSsid(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteSsidData, DeleteSsidVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.deleteSsid(
  id: id,
);
DeleteSsidData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = DefaultConnector.instance.deleteSsid(
  id: id,
).ref();
ref.execute();
```


### SaveColacionSettings
#### Required Arguments
```dart
int ticketPrice = ...;
String companyName = ...;
DefaultConnector.instance.saveColacionSettings(
  ticketPrice: ticketPrice,
  companyName: companyName,
).execute();
```

#### Optional Arguments
We return a builder for each query. For SaveColacionSettings, we created `SaveColacionSettingsBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class SaveColacionSettingsVariablesBuilder {
  ...
   SaveColacionSettingsVariablesBuilder companyRut(String? t) {
   _companyRut.value = t;
   return this;
  }
  SaveColacionSettingsVariablesBuilder companyPhone(String? t) {
   _companyPhone.value = t;
   return this;
  }
  SaveColacionSettingsVariablesBuilder companyEmail(String? t) {
   _companyEmail.value = t;
   return this;
  }

  ...
}
DefaultConnector.instance.saveColacionSettings(
  ticketPrice: ticketPrice,
  companyName: companyName,
)
.companyRut(companyRut)
.companyPhone(companyPhone)
.companyEmail(companyEmail)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<SaveColacionSettingsData, SaveColacionSettingsVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.saveColacionSettings(
  ticketPrice: ticketPrice,
  companyName: companyName,
);
SaveColacionSettingsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
int ticketPrice = ...;
String companyName = ...;

final ref = DefaultConnector.instance.saveColacionSettings(
  ticketPrice: ticketPrice,
  companyName: companyName,
).ref();
ref.execute();
```


### AddColacionTicket
#### Required Arguments
```dart
String id = ...;
Timestamp date = ...;
String month = ...;
String employeeId = ...;
String employeeName = ...;
int ticketPrice = ...;
DefaultConnector.instance.addColacionTicket(
  id: id,
  date: date,
  month: month,
  employeeId: employeeId,
  employeeName: employeeName,
  ticketPrice: ticketPrice,
).execute();
```

#### Optional Arguments
We return a builder for each query. For AddColacionTicket, we created `AddColacionTicketBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class AddColacionTicketVariablesBuilder {
  ...
   AddColacionTicketVariablesBuilder type(String t) {
   _type.value = t;
   return this;
  }
  AddColacionTicketVariablesBuilder employeeRut(String? t) {
   _employeeRut.value = t;
   return this;
  }

  ...
}
DefaultConnector.instance.addColacionTicket(
  id: id,
  date: date,
  month: month,
  employeeId: employeeId,
  employeeName: employeeName,
  ticketPrice: ticketPrice,
)
.type(type)
.employeeRut(employeeRut)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<AddColacionTicketData, AddColacionTicketVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.addColacionTicket(
  id: id,
  date: date,
  month: month,
  employeeId: employeeId,
  employeeName: employeeName,
  ticketPrice: ticketPrice,
);
AddColacionTicketData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
Timestamp date = ...;
String month = ...;
String employeeId = ...;
String employeeName = ...;
int ticketPrice = ...;

final ref = DefaultConnector.instance.addColacionTicket(
  id: id,
  date: date,
  month: month,
  employeeId: employeeId,
  employeeName: employeeName,
  ticketPrice: ticketPrice,
).ref();
ref.execute();
```


### AddIncidence
#### Required Arguments
```dart
String id = ...;
Timestamp date = ...;
DefaultConnector.instance.addIncidence(
  id: id,
  date: date,
).execute();
```

#### Optional Arguments
We return a builder for each query. For AddIncidence, we created `AddIncidenceBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class AddIncidenceVariablesBuilder {
  ...
   AddIncidenceVariablesBuilder eventId(String? t) {
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

  ...
}
DefaultConnector.instance.addIncidence(
  id: id,
  date: date,
)
.eventId(eventId)
.terminalEventId(terminalEventId)
.detail(detail)
.severity(severity)
.images(images)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<AddIncidenceData, AddIncidenceVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.addIncidence(
  id: id,
  date: date,
);
AddIncidenceData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
Timestamp date = ...;

final ref = DefaultConnector.instance.addIncidence(
  id: id,
  date: date,
).ref();
ref.execute();
```


### DeleteIncidence
#### Required Arguments
```dart
String id = ...;
DefaultConnector.instance.deleteIncidence(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteIncidenceData, DeleteIncidenceVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await DefaultConnector.instance.deleteIncidence(
  id: id,
);
DeleteIncidenceData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = DefaultConnector.instance.deleteIncidence(
  id: id,
).ref();
ref.execute();
```

