import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount < 0) return;

    widget.addTx(
      inputTitle,
      inputAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onEditingComplete: submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onEditingComplete: submitData,
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
