import 'package:flutter/material.dart';

class Admin_Users extends StatefulWidget {
  @override
  _AdminUsersState createState() => _AdminUsersState();
}

class _AdminUsersState extends State<Admin_Users> {
  String dropdownValue = 'Voters'; // Changed variable name to camelCase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Users')),
      ),
      body: Container(
        padding: EdgeInsets.all(20), // Added padding for better layout
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.menu),
          style: const TextStyle(color: Colors.white60),
          underline: Container(
            height: 2,
            color: Colors.white60,
          ),
          onChanged: (String? newValue) {
            setState(() { // Using setState to update the state
              dropdownValue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem<String>(
              value: 'One',
              child: Text('Candidates'),
            ),
          ],
        ),
      ),
    );
  }
}
