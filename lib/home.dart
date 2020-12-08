import 'dart:io';

import 'package:arcore_flutter_plugin_example/remote_object_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'remote_object_android.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ar Demo'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              if (Platform.isAndroid) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RemoteObjectAndroid(),
                  ),
                );
              } else if (Platform.isIOS) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => RemoteObjectIOS(),
                  ),
                );
              }
            },
            title: Text("Remote object"),
          ),
        ],
      ),
    );
  }
}
