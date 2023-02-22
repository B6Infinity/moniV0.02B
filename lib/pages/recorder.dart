// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Recorder extends StatefulWidget {
  const Recorder({super.key});

  @override
  State<Recorder> createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(
                    // color:
                    // (liveMoney > 0) ? Colors.green[800]! : Colors.red[800]!,
                    color: Color.fromARGB(255, 53, 224, 18),
                    blurRadius: 5,
                    offset: Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        // '₹ ${NumberFormat.decimalPattern('en_us').format(liveMoney)}',
                        '₹ 000/-',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                          // color: (liveMoney > 0) ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                // onPressed: addFlow,
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800]),
                child: Icon(Icons.download),
              ),
              ElevatedButton(
                // onPressed: () => addFlow(isIncome: false),
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.red[800]),
                child: Icon(Icons.upload),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Icon(
              Icons.history,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('ello $index'),
                  tileColor: Theme.of(context).primaryColor,
                  leading: Icon(
                    // flow.is_income ? Icons.add : Icons.remove,
                    Icons.remove,
                    // color: flow.is_income ? Colors.green : Colors.red,
                    color: Colors.red,
                    size: 30,
                  ),
                  trailing: Text(
                    // '${flow.date_of_flow.day}.${flow.date_of_flow.month}.${flow.date_of_flow.year}\n$flowTime',
                    '17.25.3002\n12:25 PM',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
