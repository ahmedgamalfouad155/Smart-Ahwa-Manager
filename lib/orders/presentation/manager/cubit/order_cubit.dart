import 'package:ahwa_manager_app/orders/data/models/order.dart';
import 'package:ahwa_manager_app/orders/data/service/drink_service.dart';
import 'package:ahwa_manager_app/orders/data/service/order.service.dart';
import 'package:ahwa_manager_app/orders/presentation/manager/cubit/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersState> { 
  final OrderRepository repository; 
 
  OrdersCubit({required this.repository}) : super(OrdersState(allOrders: [], loading: false)) { 
    loadAll(); 
  } 
 
  Future<void> loadAll() async { 
    emit(state.copyWith(loading: true, error: null)); 
    try { 
      final list = await repository.getAllOrders(); 
      emit(state.copyWith(allOrders: list, loading: false)); 
    } catch (e) { 
      emit(state.copyWith(loading: false, error: e.toString())); 
    } 
  } 
 
  Future<void> addOrder(String customerName, Drink drink, String notes) async { 
    final id = DateTime.now().microsecondsSinceEpoch.toString(); 
    final order = Order(id: id, customerName: customerName, drink: drink, notes: notes); 
    await repository.addOrder(order); 
    await loadAll(); 
  } 
 
  Future<void> completeOrder(String id) async { 
    await repository.completeOrder(id); 
    await loadAll(); 
  } 
 
  // report helpers 
  int totalOrdersServed() => state.allOrders.length; 
  Map<String, int> topSelling() { 
    final counts = <String, int>{}; 
    for (var o in state.allOrders) { 
      counts[o.drink.name] = (counts[o.drink.name] ?? 0) + 1; 
    } 
    // sort map by value desc 
    final sorted = Map.fromEntries(counts.entries.toList()..sort((a, b) => b.value.compareTo(a.value))); 
    return sorted; 
  } 
} 