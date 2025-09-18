import 'package:ahwa_manager_app/nav_bar/nav_bar_view.dart';
import 'package:ahwa_manager_app/orders/data/service/in_memory_order_repo.dart';
import 'package:ahwa_manager_app/orders/data/service/order.service.dart';
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final OrderRepository repository = InMemoryOrderRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: BlocProvider(
        create: (_) => OrdersCubit(repository: repository),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Ahwa Manager', 
          home: NavBarView(),
        ),
      ),
    );
  }
}
