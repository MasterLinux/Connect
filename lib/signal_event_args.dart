part of apetheory.event.connect;

/**
 * Provides data of an event
 *
 * example usage:
 *
 *      //create a new instance
 *      var args = new SignalEventArgs.from({
 *          "title": "example_title",
 *          "handler": (title) {
 *              print(title);
 *          }
 *      });
 *
 *      //check whether all required arguments are available
 *      var hasHandler = args.hasArgument("handler");
 *      var hasName = args.hasArgument("title");
 *
 *      //if so execute handler
 *      if(hasName && hasHandler) {
 *
 *          //get and cast arguments
 *          var handler = args["handler"] as Function;
 *          var title = args["title"] as String;
 *
 *          //do crazy stuff
 *          handler(title);
 *      }
 *
 */
class SignalEventArgs { //TODO extends EventArgs
  Map<String, Object> _args;

  /**
   * Initializes the event args.
   */
  SignalEventArgs() {
    _args = <String, Object>{};
  }

  /**
   * Initializes the event args with the
   * help of a map.
   */
  SignalEventArgs.fromMap(Map<String, Object> arguments) {
    _args = arguments;

    if(_args == null) {
      _args = <String, Object>{};
    }
  }

  /**
   * Gets an argument by its [name] or
   * returns null if an argument with
   * the given name does not exist.
   */
  Object operator [](String name) {
    return _args.containsKey(name) ? _args[name] : null;
  }

  /**
   * Sets an argument by its [name].
   */
  operator []=(String name, Object value) {
    _args[name] = value;
  }

  /**
   * Returns true if an argument with
   * the given [name] exists.
   */
  bool hasArgument(String name) {
    return _args.containsKey(name);
  }

  noSuchMethod(Invocation invocation) {
    var argName = _getSymbolName(invocation.memberName);
    var posArgsCount = 0;

    //get number of positional arguments
    if(invocation.positionalArguments != null) {
      posArgsCount = invocation.positionalArguments.length;
    }

    //try to get value
    if(invocation.isGetter && hasArgument(argName)) {
      return this[argName];
    }

    //otherwise try to set value
    else if(invocation.isSetter && posArgsCount == 1) {
      return this[argName] = invocation.positionalArguments[0];
    }

    //TODO implement setter for functions

    super.noSuchMethod(invocation);
  }

  /**
   * Tries to get the name of the given [Symbol].
   * Whenever [value] is null it returns null.
   */
  String _getSymbolName(value) {
    if(value is Symbol) {
      var name = MirrorSystem.getName(value);
      return name.replaceAll('=', '');
    }

    return value != null ? value.toString() : null;
  }
}
