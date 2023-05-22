import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import 'json/data_platform.dart';
import 'json/permission_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  DataPlatformModel dataMappingPlatform = DataPlatformModel();
  PermissionsService permissionsService = PermissionsService();

  Future<void> initPermissionOnAndroid() async {
    final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    Permission permissions = Permission.storage;
    if (androidDeviceInfo.version.sdkInt >= 30) {
      permissions = Permission.manageExternalStorage;
    }
    bool shouldShowRequestRationale =
    await permissionsService.shouldShowRequestRationale(permissions);
    if (!shouldShowRequestRationale) {
      await permissionsService.request(permissions);
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   initPermissionOnAndroid();
  //   dataMappingPlatform.createJsonFile();
  //   dataMappingPlatform.readJsonFile();
  // }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 200,
              child: MobileScanner(
                onDetect: (barcodes) {},
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
