import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function removeTx;

  TransactionList({this.transactionList, this.removeTx});

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
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transactionList[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                transactionList[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactionList[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => removeTx(transactionList[index].id),
              ),
            ),
          );
        },
        itemCount: transactionList.length,
      ),
    );
  }
}
