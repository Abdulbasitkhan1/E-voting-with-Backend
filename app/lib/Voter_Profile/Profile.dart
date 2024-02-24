import 'package:app/Voter_Profile/NextPage.dart';
import 'package:app/Voter_Profile/Update_fields.dart';
import 'package:app/Voter_Profile/voter_pp.dart';
import 'package:app/Voters.dart';
import 'package:app/login_options.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Voters user;
  ProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    Map<int, IconData> icons_leading = {
      0: Icons.person_3_rounded,
      1: Icons.person_add_alt_sharp,
      2: Icons.credit_card,
      3: Icons.phone,
      4: Icons.email_outlined,
      5: Icons.location_city,
      6: Icons.location_city_sharp,
      7: Icons.format_list_numbered_rtl_outlined,
      8: Icons.date_range,
      // Add more cases as needed
    };
    Map<int, Color> iconColors = {
      0: Colors.blueAccent,
      1: Colors.blueAccent,
      2: Colors.blueAccent,
      3: Colors.blueAccent,
      4: Colors.blueAccent,
      5: Colors.blueAccent,
      6: Colors.blueAccent,
      7: Colors.blueAccent,
      8: Colors.blueAccent,
    };
    String fname = user.First_Name;
    String lname = user.Last_Name;
    String cnic = user.Cnic;
    String phone = user.Phone_No;
    String email = user.E_Mail;

    var arrField = ['First Name', 'Last Name', 'CNIC Number', 'Contact Number', 'E-Mail'];
    var arrNames = ['$fname', '$lname', '$cnic', '$phone','$email'];
    Map<int, IconData> iconMap = {
      0: Icons.edit,
      1: Icons.edit,
      2: Icons.lock,
      3: Icons.edit,
      4: Icons.edit,
      5: Icons.edit,
      6: Icons.edit,
      7: Icons.edit,
      8: Icons.edit,
      // Add more cases as needed
    };

    return Scaffold(
      appBar: AppBar(

        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginOptionsPage()
                  ));
            },
            icon: Icon(Icons.logout_sharp), // Use Icon widget to represent the icon
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 3,
        backgroundColor: Colors.white60, // Change the background color here
        color: Colors.blueAccent,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NextPage(user)
                  ));
              break;
            case 1:

              break;
            case 2:

              break;
            case 3:
              
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
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            children: [
              Container(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        // Replace with your profile picture
                        backgroundImage: AssetImage('images/avatar.jpg'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.person_add_alt_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Voter_UploadProfileImage()
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(height: 20),
              Text(
                '$fname $lname',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              Container(height: 5),
              Text(
                '$cnic',
                style: TextStyle(color: Colors.blueGrey, fontSize: 15),
              ),
              Container(height: 20),
              Container(
                width: 200, // Set your desired width
                height: 50, // Set your desired height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set your desired border radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Voter_UploadProfileImage()
                      ),
                    );
                  },
                  child: Text(
                    'Update Profile Picture',
                    style: TextStyle(
                      fontSize: 15, // Set your desired font size
                    ),
                  ),
                ),
              ),
              Container(height: 40),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0, top: 0.0, right: 0.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                          TextSpan(
                            text: 'Personal ',
                          ),
                        ])),
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            children: [
                          TextSpan(
                            text: 'Information ',
                          )
                        ])),
                  ],
                ),
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        icons_leading[index],
                        color: iconColors[index], // Applying color from the map
                      ),
                      title: Text(arrField[index]),
                      subtitle: Text(arrNames[index]),
                      trailing: GestureDetector(
                        onTap: () {
                          // Navigate to the appropriate edit page based on the index
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FirstNamePage(user),
                                ),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LastNamePage(user),
                                ),
                              );
                              break;
                            case 2:
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContactUpdate(user),
                                ),
                              );
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmailUpdate(user),
                                ),
                              );
                            // Add other cases for CNIC, Contact no, Email, etc.
                          }
                        },
                        child: Icon(iconMap[index]),
                      ),
                    );
                  },
                  itemCount: arrNames.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 20,
                      thickness: 1,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
