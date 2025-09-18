// ignore_for_file: use_build_context_synchronously

/* Add Order Dialog */
import 'package:ahwa_manager_app/orders/data/service/drink_service.dart';
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderDialog extends StatefulWidget {
  const AddOrderDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddOrderDialogState createState() => _AddOrderDialogState();
}

class _AddOrderDialogState extends State<AddOrderDialog> {
  final _formKey = GlobalKey<FormState>();
  final _customerCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  Drink? _selectedDrink = const Shai();

  @override
  void dispose() {
    _customerCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('إضافة طلب'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _customerCtrl,
                decoration: InputDecoration(labelText: 'اسم الزبون'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'أدخل اسم الزبون' : null,
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<Drink>(
                value: _selectedDrink,
                items: [
                  DropdownMenuItem(
                    value: const Shai(),
                    child: Text(const Shai().name),
                  ),
                  DropdownMenuItem(
                    value: const TurkishCoffee(),
                    child: Text(const TurkishCoffee().name),
                  ),
                  DropdownMenuItem(
                    value: const HibiscusTea(),
                    child: Text(const HibiscusTea().name),
                  ),
                ],
                onChanged: (d) => setState(() => _selectedDrink = d),
                decoration: InputDecoration(labelText: 'نوع المشروب'),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _notesCtrl,
                decoration: InputDecoration(labelText: 'ملاحظات (اختياري)'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final name = _customerCtrl.text.trim();
              final notes = _notesCtrl.text.trim();
              final drink = _selectedDrink ?? const Shai();
              await context.read<OrdersCubit>().addOrder(name, drink, notes);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('تم إضافة الطلب')));
            }
          },
          child: Text('أضف'),
        ),
      ],
    );
  }
}
