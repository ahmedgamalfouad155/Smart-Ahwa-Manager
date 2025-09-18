/* Pending Orders Page */ 
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_state.dart';
import 'package:ahwa_manager_app/orders/presentation/widgets/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingOrdersPage extends StatelessWidget { 
  const PendingOrdersPage({super.key}); 
 
  void _showAddDialog(BuildContext context) { 
    showDialog(context: context, builder: (_) => AddOrderDialog()); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return BlocBuilder<OrdersCubit, OrdersState>( 
      builder: (context, state) { 
        final pending = state.pendingOrders; 
        return Scaffold( 
          body: state.loading 
              ? Center(child: CircularProgressIndicator()) 
              : pending.isEmpty 
                  ? Center(child: Text('لا توجد طلبات جارية')) 
                  : ListView.builder( 
                      itemCount: pending.length, 
                      itemBuilder: (context, i) { 
                        final o = pending[i]; 
                        return Card( 
                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6), 
                          child: ListTile( 
                            title: Text('${o.customerName} — ${o.drink.name}'), 
                            subtitle: Text(o.notes.isEmpty ? 'بدون ملاحظات' : o.notes), 
                            trailing: ElevatedButton( 
                              child: Text('تم'), 
                              onPressed: () { 
                                context.read<OrdersCubit>().completeOrder(o.id); 
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم اكتمال الطلب'))); 
                              }, 
                            ), 
                          ), 
                        ); 
                      }, 
                    ), 
          floatingActionButton: FloatingActionButton( 
            child: Icon(Icons.add), 
            onPressed: () => _showAddDialog(context), 
          ), 
        ); 
      }, 
    ); 
  } 
} 