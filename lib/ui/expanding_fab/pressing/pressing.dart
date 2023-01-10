import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class Pressing extends ConsumerStatefulWidget {
  const Pressing({Key? key}) : super(key: key);

  @override
  _PressingState createState() => _PressingState();
}

class _PressingState extends ConsumerState<Pressing> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = const <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text('Index 1: Essa'),
    Text(
      'Index 2: School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // your actions here
        ],
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.home_outlined)),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        iconTheme: IconThemeData(
          color: Theme
              .of(context)
              .secondaryHeaderColor,
        ),
        title: const Text('Boost Pressing'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home, color: Colors.black),
                label: SizedBox.shrink(),


              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black),
                label: SizedBox.shrink(),
              ),
              SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.account_circle, color: Colors.black),
                label: SizedBox.shrink(),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.settings, color: Colors.black),
                label: SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.go('/pressing/form');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }

}


