import 'package:flutter/material.dart';

import 'home/favorites_screen.dart';
import 'home/home_screen.dart';
import 'home/my_account_screen.dart';
import 'home/my_orders_screen.dart';
import 'home/notifications_screen.dart';

class ViewsScreen extends StatefulWidget {
  const ViewsScreen({super.key});

  @override
  State<ViewsScreen> createState() => _ViewsScreenState();
}

class _ViewsScreenState extends State<ViewsScreen> {
  int currentPage = 0;
  final pages = [
    const HomeScreen(),
    const MyOrdersScreen(),
    const MyAccountScreen(),
    const FavoritesScreen(),
    const FavoritesScreen(),
    const NotificationsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[currentPage],
    );
  }
}
