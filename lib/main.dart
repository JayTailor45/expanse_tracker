import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  void _addTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewTransaction(_addTransaction),
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: Container(
        height: 560, // TODO: Figure out something to get windows height dynamically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            TransactionList(
              transactionList: transactions,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
