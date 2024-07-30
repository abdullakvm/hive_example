import 'package:flutter/material.dart';

import 'hive_controller.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final HiveController hiveController = HiveController();
  Map<String, dynamic>? userDetails;

  void _readData() {
    var data = hiveController.readData();
    if (data is Map<String, dynamic>) {
      setState(() {
        userDetails = data;
      });
    } else {
      setState(() {
        userDetails = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: const Text(
            'Registration Completed',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 51, 164)),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 2, 51, 164))),
                onPressed: _readData,
                child: const Text(
                  'Your Details',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              if (userDetails != null)
                Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: userDetails!.entries.map((entry) {
                        return ListTile(
                          title: Text(entry.key),
                          subtitle: Text(entry.value.toString()),
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
