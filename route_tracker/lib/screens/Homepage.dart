import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:route_tracker/blocs/activitiesBloc.dart';
import 'package:route_tracker/screens/add_visits.dart';
import 'package:route_tracker/screens/dashboard.dart';
import 'package:route_tracker/screens/visits.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final apiKey = dotenv.env['API_KEY'];

  final List<Widget> _pages = [Dashboard(), AddVisits(),Visits()];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard,
          ),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Visits",
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "Visits",
        )
      ]),
    );
  }
}
