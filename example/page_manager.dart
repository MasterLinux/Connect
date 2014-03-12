part of apetheory.example.connect;

class PageManager {
  //create a new slot which is invoked when a page is loaded
  Slot _onPageLoaded = new Slot((args) {

    //you are able to check whether all required arguments are available
    var hasIsErrorOccurred = args.hasArgument("isErrorOccurred");
    var hasErrorMsg = args.hasArgument("errorMsg");

    if(hasIsErrorOccurred && hasErrorMsg) {

      //get and cast arguments
      var isErrorOccurred = args["isErrorOccurred"] as bool;
      var errorMsg = args["errorMsg"] as String;

      //do whatever you want with it ;)
      if(isErrorOccurred) {
        print(errorMsg);
      }

      //you can also access arguments by using the dot notation
      else {
        print(args.successMsg);
      }
    }
  });

  //create another slot which is invoked when a page is loaded
  Slot _onPageLoadedTwo = new Slot((args) {
    print("hey!");
  });

  PageManager() {
    //connect signal to slot so each time
    //the "Page_OnLoaded" signal is emitted
    //the _onPageLoaded Slot is invoked.
    Connect
      .signal(Page.ON_LOADED)
      .to(_onPageLoadedTwo)
      .to(_onPageLoaded);
  }

  //loads all existing pages
  void load() {
    new Page().load(false);
    new Page().load(true);
  }

  //disconnects signal from slot
  void destroy() {
    Disconnect
      .signal(Page.ON_LOADED)
      .from(_onPageLoadedTwo)
      .from(_onPageLoaded);
  }
}