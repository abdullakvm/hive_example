import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_example/hiveexample/hive_controller.dart';
import 'package:hive_example/hiveexample/page2.dart';

class Hivehome extends StatefulWidget {
  const Hivehome({super.key});

  @override
  State<Hivehome> createState() => _HivehomeState();
}

class _HivehomeState extends State<Hivehome> {
  final HiveController hiveController = HiveController();
  final Showsnack snack = Showsnack();

  List<TextEditingController> controllers =
      List.generate(5, (_) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 1, 133),
        centerTitle: true,
        title: const Text(
          'Registration',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                txtfield(textController: controllers[0], title: 'Name'),
                txtfield(textController: controllers[1], title: 'Phone'),
                txtfield(textController: controllers[2], title: 'Email'),
                txtfield(textController: controllers[3], title: 'Age'),
                txtfield(textController: controllers[4], title: 'Username'),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          hiveController.writeData(
                              Name: controllers[0].text,
                              Phone: controllers[1].text,
                              Email: controllers[2].text,
                              Age: controllers[3].text,
                              Username: controllers[4].text);
                          snack.snackMessenger(context,
                              message: 'Added User Details');
                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 2, 51, 164))),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          hiveController.deleteData();

                          snack.snackMessenger(context,
                              message: 'Deleted User Details');
                        },
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 2, 51, 164))),
                        child: const Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Page2());
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.white)),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 2, 51, 164)),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding txtfield(
    {required TextEditingController textController, required String title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: TextFormField(
      controller: textController,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    ),
  );
}
