import 'package:expansetracker/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Pen',
      amount: 1.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Water Colors',
      amount: 10.0,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((obj) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$ ${obj.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          obj.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(obj.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
