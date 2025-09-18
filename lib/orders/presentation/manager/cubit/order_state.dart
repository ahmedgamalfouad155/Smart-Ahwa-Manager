import 'package:ahwa_manager_app/orders/data/models/order.dart';

class OrdersState { 
  final List<Order> allOrders; 
  final bool loading; 
  final String? error; 
 
  OrdersState({ 
    required this.allOrders, 
    required this.loading, 
    this.error, 
  }); 
 
  List<Order> get pendingOrders => allOrders.where((o) => !o.completed).toList(); 
  List<Order> get completedOrders => allOrders.where((o) => o.completed).toList(); 
 
  OrdersState copyWith({ 
    List<Order>? allOrders, 
    bool? loading, 
    String? error, 
  }) { 
    return OrdersState( 
      allOrders: allOrders ?? this.allOrders, 
      loading: loading ?? this.loading, 
      error: error, 
    ); 
  } 
} 