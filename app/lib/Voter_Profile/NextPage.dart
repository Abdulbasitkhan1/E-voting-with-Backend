import 'package:app/Admin_users/users.dart';
import 'package:app/Candidates.dart';
import 'package:app/Voter_Profile/Profile.dart';
import 'package:app/Voters.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final Voters person;

  const NextPage(this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          backgroundColor: Colors.white60, // Change the background color here
          color: Colors.blueAccent,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            switch (index) {
              case 0:
                break;
              case 1:

                break;
              case 2:

                break;
              case 3:
           
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => ProfilePage((person))
            ));
                break;
            }
          },
          items: [
          Icon(Icons.home,),
            Icon(Icons.favorite),
            Icon(Icons.settings),
            Icon(Icons.account_circle),

          ],
        ),
        body: Container());
  }
}


