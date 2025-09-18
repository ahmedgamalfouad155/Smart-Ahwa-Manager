
import 'package:ahwa_manager_app/orders/data/models/order.dart';

abstract class OrderRepository { 
  Future<void> addOrder(Order order); 
  Future<void> completeOrder(String id); 
  Future<List<Order>> getAllOrders(); 
  Future<List<Order>> getPendingOrders(); 
  Future<Order?> getById(String id); 
} 