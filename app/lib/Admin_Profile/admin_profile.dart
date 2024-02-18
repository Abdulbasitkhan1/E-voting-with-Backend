import 'package:app/Admin_Profile/Admin_UpdateFields.dart';
import 'package:app/Admin_Profile/Admin_home.dart';
import 'package:app/Admin_Profile/admin_pp.dart';
import 'package:app/login_options.dart';
import 'package:flutter/material.dart';

import '../Admins.dart';


class admin_ProfilePage extends StatelessWidget {
  final Admins user;
  admin_ProfilePage(this.user);
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
      // Add more cases as needed
    };
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Admin_Home(user,),
                ));
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: 3,
        destinations: [
          NavigationDestination(
              icon: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Admin_Home(user),
                        ));
                  },
                  child: Icon(Icons.home)), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.feed), label: 'Feed'),
          NavigationDestination(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
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
                        backgroundImage:
                        AssetImage('images/avatar.jpg'),
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
                                    builder: (context) => UploadProfileImage()
                                  ));
                              // Handle edit button tap
                              // You can navigate to the edit profile screen or show a dialog here
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
                width: 200,  // Set your desired width
                height: 50,  // Set your desired height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),  // Set your desired border radius
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadProfileImage()
                      ),
                    );
                  },
                  child: Text(
                    'Update Profile Picture',
                    style: TextStyle(
                      fontSize: 15,  // Set your desired font size
                    ),
                  ),
                ),
              ),
              Container(height: 40),
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 0.0, right: 0.0, bottom: 0.0),
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
                              color: Colors.purple,
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
                                    builder: (context) => Admin_FirstNamePage(user)
                                ),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Admin_LastNamePage(user)
                                ),
                              );
                              break;
                            case 2:
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //   ),
                              // );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Admin_ContactUpdate(user)
                                ),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Admin_EmailUpdate(user)
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

