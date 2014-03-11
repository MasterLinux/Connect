library apetheory.example.connect;

import '../lib/connect.dart';

part 'page.dart';
part 'page_manager.dart';

void main() {
  var pageManager = new PageManager();
  pageManager.load();
  pageManager.destroy();
}
