import 'package:get/get.dart';
import 'package:hive_example/hiveexample/page2.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';

class HiveController {
  final Box _box = Hive.box('mybox');

//  write
  void writeData(
      {required String Name,
      required String Phone,
      required String Email,
      required String Age,
      required String Username}) {
    var userMap = {
      "Name": Name,
      "Phone": Phone,
      "Email": Email,
      "Age": Age,
      "Username": Username
    };
    _box.put('userdetails', userMap);
  }

// read
  dynamic readData() {
    var userDetails = _box.get('userdetails');
    if (userDetails == null || userDetails.isEmpty) {
      return ('Nothing to fetch');
    } else {
      return userDetails;
    }
  }

// delete
  void deleteData() {
    _box.delete('userdetails');
  }
}

class Showsnack {
  void snackMessenger(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.all(16.0),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      content: Text(message),
    ));
  }
}

class AppRoutes {
  static const home = '/Hivehome';
  static const swit = '/Page2';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const Page2(),
    ),
  ];
  static final List<GetPage> page2 = [
    GetPage(
      name: AppRoutes.swit,
      page: () => const Page2(),
    ),
  ];
}
