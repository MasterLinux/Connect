part of apetheory.event.connect;

class FunctionNotAllowedException implements Exception {
  String _name;

  FunctionNotAllowedException(String name) : _name = name;

  String toString() {
    if(_name == null) {
      return "Name must not be null";
    }

    return '[$_name] Value must not be a Function';
  }
}
