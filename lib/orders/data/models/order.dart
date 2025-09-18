
import 'package:ahwa_manager_app/orders/data/service/drink_service.dart';

class Order { 
  final String _id; 
  final String _customerName; 
  final Drink _drink; 
  final String _notes; 
  bool _completed; 
  final DateTime _createdAt; 
 
  Order({ 
    required String id, 
    required String customerName, 
    required Drink drink, 
    String notes = '', 
    bool completed = false, 
    DateTime? createdAt, 
  })  : _id = id, 
        _customerName = customerName, 
        _drink = drink, 
        _notes = notes, 
        _completed = completed, 
        _createdAt = createdAt ?? DateTime.now(); 
 
  String get id => _id; 
  String get customerName => _customerName; 
  Drink get drink => _drink; 
  String get notes => _notes; 
  bool get completed => _completed; 
  DateTime get createdAt => _createdAt; 
 
  void markComplete() { 
    _completed = true; 
  } 
 
  Order copyWith({ 
    String? customerName, 
    Drink? drink, 
    String? notes, 
    bool? completed, 
  }) { 
    return Order( 
      id: id, 
      customerName: customerName ?? _customerName, 
      drink: drink ?? _drink, 
      notes: notes ?? _notes, 
      completed: completed ?? _completed, 
      createdAt: _createdAt, 
    ); 
  } 
} 