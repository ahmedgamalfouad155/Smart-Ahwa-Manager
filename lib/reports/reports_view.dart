
/* Report Page */ 
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatelessWidget { 
  const ReportPage({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return BlocBuilder<OrdersCubit, OrdersState>( 
      builder: (context, state) { 
        final cubit = context.read<OrdersCubit>(); 
        final totals = cubit.topSelling(); 
        final totalOrders = cubit.totalOrdersServed(); 
 
        return Padding( 
          padding: EdgeInsets.all(12), 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [ 
              Text('التقرير', style: Theme.of(context).textTheme.headlineLarge), 
              SizedBox(height: 12), 
              Text('إجمالي الطلبات: $totalOrders'), 
              SizedBox(height: 12), 
              Text('الأكثر مبيعاً:', style: TextStyle(fontWeight: FontWeight.bold)), 
              SizedBox(height: 8), 
              if (totals.isEmpty) 
                Text('لا بيانات بعد') 
              else 
                Expanded( 
                  child: ListView( 
                    children: totals.entries.map((e) { 
                      return ListTile( 
                        title: Text(e.key), 
                        trailing: Text('${e.value}'), 
                      ); 
                    }).toList(), 
                  ), 
                ), 
            ], 
          ), 
        ); 
      }, 
    ); 
  } 
} 

