import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(labelText: 'Título'),
            controller: titleController,
            onSubmitted: (_) => _submitForm(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Valor (R\$)'),
            controller: valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _submitForm,
                style: TextButton.styleFrom(foregroundColor: Colors.purple),
                child: Text('Nova Transação'),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
