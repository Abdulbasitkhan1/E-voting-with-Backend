import 'package:app/Candidate_Profile/candidate_profile.dart';
import 'package:app/Candidates.dart';
import 'package:flutter/material.dart';

class Candidate_Home extends StatelessWidget {
  final Candidates candidates;

  const Candidate_Home(this.candidates);
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
                              builder: (context) => candidate_ProfilePage(candidates)
                          ));
                    },
                    child: Icon(Icons.person)), label: 'Profile'),
          ],
        ),
        body: Container());
  }
}
