import 'dart:io';
import 'package:raavailability/raavailability.dart';
import 'package:arcore_flutter_plugin_example/remote_object_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'remote_object_android.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isArAvailable;

  @override
  void initState() {
    _initializeAvailability();
    super.initState();
  }

  Future _initializeAvailability() async {
    bool supported;
    try {
      supported = await Raavailability.isSupported;
    } catch (e) {
      supported = false;
    }

    if (!mounted) return;

    setState(() {
      isArAvailable = supported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ar playground'),
      ),
      body: ListView(
        children: [
          if (isArAvailable == true)
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
              title: Text('Remote object'),
            )
          else if (isArAvailable == null)
            Center(
              child: Text('Checking AR-support for the device...'),
            )
          else
            Center(
              child: Text('This device does not support AR...'),
            ),
        ],
      ),
    );
  }
}
