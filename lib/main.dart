import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashlob_app/Model/model.dart';
import 'package:hashlob_app/Screen/Homepage/homepage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Constant/constant.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final documnet = await getApplicationDocumentsDirectory();
  Hive.init(documnet.path);
  Hive.registerAdapter(DatumAdapter());
  await Hive.openBox<Datum>(hiveBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
