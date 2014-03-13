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
        "errorMsg": "Unable to load page."
    });

    //or just add a new argument by using the dot notation
    args.successMsg = "Page is loaded completely!";

    //emit signal
    Connect
      .signal(ON_LOADED)
      .emit(args)
      .then((_) => print("completed"));
  }
}
