import 'package:flutter/material.dart';
import 'package:wallet_fltr/screens/converter.dart';
import 'package:wallet_fltr/screens/home.dart';
import 'package:wallet_fltr/screens/statistics.dart';
import 'package:wallet_fltr/screens/wallet.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const String _title = 'App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Converter(),
    Stat(),
    Wallet()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.swap_horiz),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.timeline_outlined),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.account_balance_wallet_outlined),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
