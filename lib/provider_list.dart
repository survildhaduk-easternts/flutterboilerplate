
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'injection_container.dart' as di;

class ListProvider extends MultiProvider {
  ListProvider({super.key, required List<SingleChildWidget> providers})
      : super(providers: providers);

  static List<SingleChildWidget> providerList = [];
}
