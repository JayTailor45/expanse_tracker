import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

  submitData () {
    final title = titleInputController.text;
    final amount = double.parse(amountInputController.text);

    if(title.isEmpty || amount <= 0) {
      return;
    }

    addTx(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleInputController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountInputController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                child: Text('Add transaction'),
                textColor: Colors.purple,
                onPressed: submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
