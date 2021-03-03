import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _date = DateTime.now();

  void _submitData() {
    if (_amountController.text.isEmpty) return;
    final inputTitle = _titleController.text;
    final inputAmount = double.parse(_amountController.text);

    if (inputTitle.isEmpty || inputAmount < 0 || _date == null) return;

    widget.addTx(
      inputTitle,
      inputAmount,
      _date,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;
      setState(() {
        this._date = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onEditingComplete: _submitData,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onEditingComplete: _submitData,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_date == null
                        ? 'No Date Chosen!'
                        : ' Picked Date: ${DateFormat.yMd().format(_date)}'),
                  ),
                  FlatButton(
                    child: Text('Choose Date'),
                    onPressed: _presentDatePicker,
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: _submitData,
                      child: Text('Add Transaction'),
                      textColor: Theme.of(context).textTheme.button.color,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
