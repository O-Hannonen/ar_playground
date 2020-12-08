import 'dart:io';

import 'package:arcore_flutter_plugin_example/home.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart'
    show ArCoreController;

void main() async {
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    print('ARCORE IS AVAILABLE: ');
    print(await ArCoreController.checkArCoreAvailability());
    print('\nAR SERVICES INSTALLED: ');
    print(await ArCoreController.checkIsArCoreInstalled());
  }

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
