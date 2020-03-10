import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList({this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 342, // TODO: Figure out something to get windows height dynamically
      child:
      transactionList.isEmpty ?
        Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
          ),
          SizedBox(
            height: 20,
          ),
          Text('No transactions added yet!'),
        ])
          : ListView.builder(
        itemBuilder: (BuildContext context,int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor, width: 2),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$ ${transactionList[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactionList[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactionList[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactionList.length,
      ),
    );
  }
}
