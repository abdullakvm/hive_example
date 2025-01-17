import 'package:flutter/material.dart';
import 'package:hive_example/hiveexample/hive_controller.dart';
import 'package:hive_example/hiveexample/hive_home.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:get/get.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Hivehome(),
      getPages: AppPages.pages,
    );
  }
}
