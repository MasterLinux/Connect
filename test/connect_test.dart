import 'package:unittest/unittest.dart';
import '../lib/connect.dart';

class ConnectTest {
  Slot _onLoadedSlot;
  static const String _SIGNAL_LOADED = "loaded";

  EventTest() {
    _onLoadedSlot = new Slot((args) {
      print("is loaded");
    });
  }

  //TODO implement tests
  void testConnect() {
    group('Connect', () {
      test('adding and removing slots', () {
        Connect
          .signal(_SIGNAL_LOADED)
          .to(_onLoadedSlot);

        //expect(new EventManager(_SIGNAL_LOADED).count, equals(1));

        Disconnect
          .signal(_SIGNAL_LOADED)
          .from(_onLoadedSlot);

      });
    });
  }
}

void main() {
  var t = new ConnectTest();
  t.testConnect();
}
