Changelog
=========

##1.0.0-alpha.3
* Replaced the `SignalEventArgs.from` constructor with the `fromMap` constructor.
* Removed support for setting functions as argument.
* Added default constructor to `SignalEventArgs`.
* Added the `[]=` operator to `SignalEventArgs` to set or update arguments.
* Added the `noSuchMethod` to `SignalEventArgs` to allow accessing or setting properties by dot notation.

```Dart
var args = new SignalEventArgs();

//set new property by dot notation
args.testMsg = "That's a test!";

//get this property by dot notation
print(args.testMsg);

//check whether the argument exists
var isMissing = args.example == null;

//prints true
print(isMissing);
```