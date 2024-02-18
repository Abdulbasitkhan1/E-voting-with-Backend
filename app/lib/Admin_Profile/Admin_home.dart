import 'package:app/Admin_Profile/admin_profile.dart';
import 'package:flutter/material.dart';

import '../Admins.dart';

class Admin_Home extends StatelessWidget {
  final Admins admins;

  const Admin_Home(this.admins);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: 0,
          destinations: [

            NavigationDestination(
                icon: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => VoteDashboard(),
                      //     ));
                    },
                    child: Icon(Icons.home)), label: 'Home'),
            NavigationDestination(
                icon: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Settings(),
                      //     ));
                    },
                    child: Icon(Icons.feed)), label: 'Feed'),
            NavigationDestination(
                icon: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => HomeScreen(),
                      //     ));
                    },
                    child: Icon(Icons.search_outlined)), label: 'Search'),
            NavigationDestination(
                icon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => admin_ProfilePage(admins)
                          ));
                    },
                    child: Icon(Icons.person)), label: 'Profile'),
          ],
        ),
        body: Container());
  }
}
