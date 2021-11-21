import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String title, double amount, DateTime date) onSubmited;

  const NewTransaction(this.onSubmited, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _handleSubmit() {
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) return;
    widget.onSubmited(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Title"),
            ),
            onSubmitted: (_) {
              _handleSubmit();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Amount"),
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (_) {
              _handleSubmit();
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_selectedDate == null
                  ? "Please select a date!"
                  : "Selected Date: ${DateFormat.yMMMd().format(_selectedDate!)}"),
              TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime.now(),
                  ).then((value) => {
                        setState(() {
                          _selectedDate = value!;
                        })
                      });
                },
                child: const Text("Choose Date"),
              )
            ],
          )
        ],
      ),
    );
  }
}
