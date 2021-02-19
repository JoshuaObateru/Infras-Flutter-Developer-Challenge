import 'package:flutter/material.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/pages/enter_expenses.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/pages/view_expenses.dart';
import 'package:infras_flutter_developer_challenge/features/movies/presentation/pages/movies_list.dart';
import 'package:infras_flutter_developer_challenge/values/colors.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    EnterExpenses(),
    MoviesList(),
    ViewExpenses()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        elevation: 0,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Enter Expenses',
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'All Expenses')
        ],
      ),
    );
  }
}
