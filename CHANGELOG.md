Changelog
=========

##1.0.0-alpha.3
* Replaced the `SignalEventArgs.from` constructor with the `fromMap` constructor.
* Added the `[]=` operator to `SignalEventArgs` to set or update arguments.
* Added the `noSuchMethod` to `SignalEventArgs` to allow accessing or setting properties by dot notation

```Dart
var args = new SignalEventArgs.fromMap({});

//set new property by dot notation
args.testMsg = "That's a test!";

//get this property by dot notation
print(args.testMsg);

//throws NoSuchMethodError
print(args.example);
```