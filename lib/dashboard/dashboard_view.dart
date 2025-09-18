import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget _statTile(String label, String value) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(label),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final total = context.read<OrdersCubit>().totalOrdersServed();
        final pending = state.pendingOrders.length;
        final completed = state.completedOrders.length;

        return Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'لوحة التحكم',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _statTile('إجمالي الطلبات', '$total')),
                  Expanded(child: _statTile('جارية', '$pending')),
                  Expanded(child: _statTile('مكتملة', '$completed')),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'الطلبات الجارية',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Expanded(
                child: state.pendingOrders.isEmpty
                    ? Center(child: Text('لا توجد طلبات جارية'))
                    : ListView.builder(
                        itemCount: state.pendingOrders.length,
                        itemBuilder: (context, i) {
                          final o = state.pendingOrders[i];
                          return ListTile(
                            title: Text('${o.customerName} — ${o.drink.name}'),
                            subtitle: Text(
                              o.notes.isEmpty ? 'بدون ملاحظات' : o.notes,
                            ),
                            trailing: Text(
                              '${o.createdAt.hour}:${o.createdAt.minute.toString().padLeft(2, '0')}',
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
