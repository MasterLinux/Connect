Connect
=======
This library is used for communication between objects.

##Initial stuff
First add the `connect` library to your project by adding it to your **pubspec.yaml** like

    dependencies:
        connect: ">= 1.0.0"

Than import it into your project with the following line.

    import 'package:connect/connect.dart';


##A small introduction
This library consists of two main classes for connecting and disconnecting `signal`s and `slot`s.

* Connect -> *connects a signal to a slot*
* Disconnect -> *disconnects a signal from a slot*

A **signal** is just a *String* and could be a static and constant class member, for example:

    class Page {
        static const String ON_LOADED = "Page_OnLoaded";
    }

A **slot** is like a Runnable in Java and holds a function which will be executed asynchronously.

    class PageManager {
        Slot _onPageLoaded = new Slot((args) {
            //do some crazy stuff
        });
    }

##How-to use
In the following example you can see how-to use this library.

    class Page {
        static const String ON_LOADED = "Page_OnLoaded";

        //loads the page
        void load() {
            _onLoaded(true);
        }

        //on loaded handler which is invoked when
        //the page is completely loaded
        void _onLoaded(bool isErrorOccurred) {

            //emit signal. When all connected slots
            //are executed the "completed" String
            //is printed.
            Connect
                .signal(ON_LOADED)
                .emit(new SignalEventArgs.from({
                    "isErrorOccurred": isErrorOccurred,
                    "errorMsg": "Unable to load page.",
                    "printError": (msg) {
                        print(msg);
                    }
                })).then((_) => print("completed"));;
        }
    }

    class PageManager {
        //create a new slot which is invoked when a page is loaded
        Slot _onPageLoaded = new Slot((args) {

            //you are able to check whether all required arguments are available
            var hasIsErrorOccurred = args.hasArgument("isErrorOccurred");
            var hasErrorMsg = args.hasArgument("errorMsg");
            var hasPrintError = args.hasArgument("printError");

            if(hasIsErrorOccurred && hasErrorMsg && hasPrintError) {

                //get and cast arguments
                var isErrorOccurred = args["isErrorOccurred"] as bool;
                var errorMsg = args["errorMsg"] as String;
                var printError = args["printError"] as Function;

                //do whatever you want with it ;)
                if(isErrorOccurred) {
                    printError(errorMsg);
                }
            }
        });

        PageManager() {
            //connect signal to slot so each time
            //the "Page_OnLoaded" signal is emitted
            //the _onPageLoaded Slot is invoked.
            Connect
                .signal(Page.ON_LOADED)
                .to(_onPageLoaded);
        }

        //loads all existing pages
        void load() {
            new Page().load();
        }

        //disconnects signal from slot
        void destroy() {
            Disconnect
                .signal(Page.ON_LOADED)
                .from(_onPageLoaded);
        }
    }

    void main() {
        var pageManager = new PageManager();
        pageManager.load();
        pageManager.destroy();
    }
