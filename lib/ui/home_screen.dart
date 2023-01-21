import 'package:boost_ballistics/providers/states/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boost_ballistics/ui/expanding_fab/action_button.dart';
import 'package:boost_ballistics/ui/expanding_fab/expanding_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            tooltip: "",
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text(
            "Boost Ballistics",
          ),
          actions: [
            IconButton(
              tooltip: "",
              icon: const Icon(
                Icons.favorite,
              ),
              onPressed: () {},
            ),
            IconButton(
              tooltip: "",
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ]),
      body: Center(
          child: ElevatedButton(
        child: const Text('Sign Out'),
        onPressed: () {
          context.go('/login');
          ref.read(loginControllerProvider.notifier).signOut();
        },
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: IconTheme(
          data: const IconThemeData(color: Colors.deepOrange),
          child: Row(
            children: [
              IconButton(
                tooltip: "",
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}*/

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeState();
}

class _HomeState extends ConsumerState<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: _openEndDrawer,
                // Handle the profile icon press
              ),
            ],
            automaticallyImplyLeading: false,
            title: const Center(child: Text('Boost')),
            backgroundColor: Theme.of(context).primaryColor,
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
          ),
          endDrawer: Drawer(
              child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: _closeEndDrawer,
                      )
                    ],
                  ),
                  body: Center(
                      child: ElevatedButton(
                    child: const Text('Sign Out'),
                    onPressed: () {
                      context.go('/login');
                      ref.read(loginControllerProvider.notifier).signOut();
                    },
                  )))),
          body: const Center(child: Text("Hello world!")),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.deepPurple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.yellowAccent,
              ),
            ],
          ),
          floatingActionButton: ExpandableFab(distance: 80, children: [
            ActionButton(
              icon: const Icon(
                Icons.science_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                print('person');
              },
            ),
            ActionButton(
                icon: const Icon(
                  Icons.soap_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.go('/pressing');
                }),
            ActionButton(
              icon: const Icon(
                Icons.redeem_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                print('add');
              },
            ),
          ]),
        ));
  }
}
