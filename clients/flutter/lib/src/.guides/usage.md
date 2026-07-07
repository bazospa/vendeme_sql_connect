# Basic Usage

```dart
DefaultConnector.instance.UpsertSsid(upsertSsidVariables).execute();
DefaultConnector.instance.DeleteSsid(deleteSsidVariables).execute();
DefaultConnector.instance.ListSsids().execute();
DefaultConnector.instance.SsidBySsid(ssidBySsidVariables).execute();
DefaultConnector.instance.SaveColacionSettings(saveColacionSettingsVariables).execute();
DefaultConnector.instance.AddColacionTicket(addColacionTicketVariables).execute();
DefaultConnector.instance.GetColacionSettings().execute();
DefaultConnector.instance.ListColacionTicketsByMonth(listColacionTicketsByMonthVariables).execute();
DefaultConnector.instance.AddIncidence(addIncidenceVariables).execute();
DefaultConnector.instance.DeleteIncidence(deleteIncidenceVariables).execute();

```

## Optional Fields

Some operations may have optional fields. In these cases, the Flutter SDK exposes a builder method, and will have to be set separately.

Optional fields can be discovered based on classes that have `Optional` object types.

This is an example of a mutation with an optional field:

```dart
await DefaultConnector.instance.AddIncidence({ ... })
.eventId(...)
.execute();
```

Note: the above example is a mutation, but the same logic applies to query operations as well. Additionally, `createMovie` is an example, and may not be available to the user.

