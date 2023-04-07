// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_print

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moni/controllers.dart';
import 'package:moni/utils/subtle_defs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences prefs;

  int moni = 0;
  bool isInitied = false;

  Future getPreferences() async {
    prefs = await SharedPreferences.getInstance();

    try {
      prefs.getInt('moni');
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
      print('Error while getting int! Setting mock initial values...');
    }

    if (prefs.getInt('moni') == null) {
      prefs.setInt('moni', 0);
      print('Has been set to 0');
    }

    moni = prefs.getInt('moni')!;
    isInitied = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getPreferences();
  }

  void confirmFlow(int amt, bool isIncome) async {
    print('Flow $amt');

    // int moni = await prefs.getInt('moni') ?? 0;

    moni = isIncome ? moni + amt : moni - amt;
    print(moni);

    prefs.setInt('moni', moni);
    setState(() {});
  }

  void showMoneyFlowDialog(bool isIncome) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${isIncome ? 'Add' : 'Remove'} Money'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: moneyFlowController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  icon: Icon(Icons.currency_rupee_rounded),
                  iconColor: isIncome ? Colors.green : Colors.red,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      moneyFlowController.text =
                          "${int.parse(moneyFlowController.text) + 500}";
                    },
                    child: Text('500',
                        style: TextStyle(color: Colors.greenAccent)),
                  ),
                  TextButton(
                    onPressed: () {
                      moneyFlowController.text =
                          "${int.parse(moneyFlowController.text) + 1000}";
                    },
                    child: Text('1000',
                        style: TextStyle(color: Colors.greenAccent)),
                  ),
                  TextButton(
                    onPressed: () {
                      moneyFlowController.text =
                          "${int.parse(moneyFlowController.text) + 2000}";
                    },
                    child: Text('2000',
                        style: TextStyle(color: Colors.greenAccent)),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      moneyFlowController.text =
                          "${int.parse(moneyFlowController.text) - 500}";
                    },
                    child:
                        Text('500', style: TextStyle(color: Colors.redAccent)),
                  ),
                  TextButton(
                    onPressed: () {
                      moneyFlowController.text =
                          "${int.parse(moneyFlowController.text) - 1000}";
                    },
                    child:
                        Text('1000', style: TextStyle(color: Colors.redAccent)),
                  ),
                  TextButton(
                    onPressed: () {
                      moneyFlowController.text =
                          "${int.parse(moneyFlowController.text) - 2000}";
                    },
                    child:
                        Text('2000', style: TextStyle(color: Colors.redAccent)),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                confirmFlow(int.parse(moneyFlowController.text), isIncome);
                Navigator.pop(context);
              },
              child: Text(
                'CONFIRM',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('moni'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isInitied
              ? h3heading('$moni', multiplier: 3, padding: 20)
              : CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => {showMoneyFlowDialog(true)},
                child: Icon(Icons.add),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => {showMoneyFlowDialog(false)},
                child: Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
