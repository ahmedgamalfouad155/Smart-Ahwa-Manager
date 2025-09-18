/* In-memory implementation (for demo; swap with Hive/Firebase easily) */ 
import 'package:ahwa_manager_app/orders/data/models/order.dart';
import 'package:ahwa_manager_app/orders/data/service/order.service.dart';

class InMemoryOrderRepository implements OrderRepository { 
  final Map<String, Order> _store = {}; 
 
  @override 
  Future<void> addOrder(Order order) async { 
    _store[order.id] = order; 
    await Future.delayed(Duration(milliseconds: 50)); // simulate latency 
  } 
 
  @override 
  Future<Order?> getById(String id) async { 
    return _store[id]; 
  } 
 
  @override 
  Future<List<Order>> getAllOrders() async { 
    return _store.values.toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt)); 
  } 
 
  @override 
  Future<List<Order>> getPendingOrders() async { 
    return _store.values.where((o) => !o.completed).toList()..sort((a, b) => a.createdAt.compareTo(b.createdAt)); 
  } 
 
  @override 
  Future<void> completeOrder(String id) async { 
    final order = _store[id]; 
    if (order != null) { 
      order.markComplete(); 
      _store[id] = order; 
    } 
    await Future.delayed(Duration(milliseconds: 50)); 
  } 
} 