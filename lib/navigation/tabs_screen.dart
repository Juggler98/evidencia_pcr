import 'package:evidencia_pcr/Application.dart';
import 'package:evidencia_pcr/navigation/new_test_screen.dart';
import 'package:evidencia_pcr/navigation/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main_drawer.dart';
import 'search_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen();

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin, RouteAware {
  List<Widget> _pages;

  PageController _pageController;

  int _selectedPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _pages = [
      SearchScreen(),
      NewTestScreen(),
      StatsScreen(),
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  var _isDarkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectPage(int index) {
    if (_selectedPageIndex != index) {
      setState(() {
        _selectedPageIndex = index;
        _pageController.jumpToPage(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Evidencia PCR testov',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            tooltip: 'Ulož do súboru',
            onPressed: () {},
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _selectedPageIndex != 2 ? null : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPageIndex,
        //selectedIconTheme: IconThemeData(color: Colors.green),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Hľadaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Pridaj test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Štatistiky',
          ),
        ],
      ),
    );
  }
}
