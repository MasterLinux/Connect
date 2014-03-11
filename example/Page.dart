part of apetheory.example.connect;

class Page {
  static const String ON_LOADED = "Page_OnLoaded";

  //loads the page
  void load(bool isErrorOccurred) {
    _onLoaded(isErrorOccurred);
  }

  //on loaded handler which is invoked when
  //the page is completely loaded
  void _onLoaded(bool isErrorOccurred) {

    //initialize event args from map
    var args = new SignalEventArgs.fromMap({
        "isErrorOccurred": isErrorOccurred,
        "errorMsg": "Unable to load page.",
        "printError": (msg) {
          print("error: $msg");
        }
    });

    //or just add a new argument by setter
    args.successMsg = "Page is loaded completely!";
    args.printSuccess = (msg) {
      print("success: $msg");
    };

    //emit signal. When all connected slots
    //are executed the "completed" String
    //is printed.
    Connect
    .signal(ON_LOADED)
    .emit(args).then((_) => print("completed"));;
  }
}
