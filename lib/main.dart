import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './dc.dart' as dc;
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = await Routes.initialRoute;
  await dc.init();
  runApp(App(initialRoute));
}

class App extends StatelessWidget {
  final String initialRoute;
  const App(this.initialRoute, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
