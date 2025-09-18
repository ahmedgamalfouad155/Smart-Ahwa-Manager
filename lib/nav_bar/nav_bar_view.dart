// ignore_for_file: library_private_types_in_public_api

import 'package:ahwa_manager_app/dashboard/dashboard_view.dart';
import 'package:ahwa_manager_app/orders/presentation/view/orders_view.dart';
import 'package:ahwa_manager_app/reports/reports_view.dart';
import 'package:flutter/material.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  _NavBarViewState createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _selected = 0;

  final tabs = [PendingOrdersPage(), DashboardPage(), ReportPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Ahwa Manager')),
      body: tabs[_selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected,
        onTap: (i) => setState(() => _selected = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Report'),
        ],
      ),
    );
  }
}
