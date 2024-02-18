import 'package:app/SignUp_Pages/SignUpPage.dart';
import 'package:flutter/material.dart';

import 'Login_Pages/Candidate_Login.dart';
import 'Login_Pages/Voter_Login.dart';

class LoginOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set your desired background color here
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child :Image.asset("assets/images/positive-vote.png"),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Mainn',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Do you want to ',
                        style: TextStyle(color: Colors.white, ),
                      ),
                      TextSpan(
                        text: 'Login as',
                        style: TextStyle(color: Colors.black, ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(''),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // Add shadow to the button
                    elevation: 40,
                    shadowColor: Colors.black,
                    side: BorderSide(color: Colors.white70, width: 2),
                  ),
                  child: Text('Admin'),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VoterLoginPage()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // Add shadow to the button
                    side: BorderSide(color: Colors.white70, width: 2),
                    elevation: 40,
                    shadowColor: Colors.black,
                  ),

                  child: Text('Voter'),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CandidateLoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // Add shadow to the button
                    elevation: 40,
                    shadowColor: Colors.black,
                    side: BorderSide(color: Colors.white70, width: 2),
                  ),
                  child: Text('Candidate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
