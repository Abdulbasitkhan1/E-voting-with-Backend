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
          items: [
            InkWell(
              onTap: () {
              },
              child: Column(
                children: [
                  Icon(Icons.home),
                  Text('Home'), // Add label
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Handle the onTap event for the second item
              },
              child: Column(

                children: [
                  Icon(Icons.feed),
                  Text('feed'), // Add label
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Handle the onTap event for the second item
              },
              child: Column(

                children: [
                  Icon(Icons.question_answer_outlined),
                  Text('FAQ'), // Add label
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(person)
                  ),
                );
                // Handle the onTap event for the second item
              },
              child: Column(

                children: [
                  Icon(Icons.person),
                  Text('Profile'), // Add label
                ],
              ),
            ),
          ],
          onTap: (index) {

          },
        ),
        body: Container());
  }
}


