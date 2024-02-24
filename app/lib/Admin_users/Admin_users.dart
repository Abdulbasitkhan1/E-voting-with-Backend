import 'package:app/Admin_Profile/Admin_home.dart';
import 'package:app/Admin_Profile/admin_profile.dart';
import 'package:app/Admins.dart';
import 'package:flutter/material.dart';

class User {
  final String name;
  final String cnic;
  final String image;
  bool isFollowedByMe;

  User(this.name, this.cnic, this.image, this.isFollowedByMe);
}

class CandidateUsers extends StatefulWidget {
  @override
  _CandidateUsersState createState() => _CandidateUsersState();
}

class _CandidateUsersState extends State<CandidateUsers> {
  List<User>_users = [
    User('Abdul','54400-8554345-3','https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',false),
    User('Basit','54400-8554345-4','https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',false),
    User('Khan','54400-8554345-5','https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',false),
    User('Alishah','54400-8554345-6','https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',false),
    User('Akbir','54400-8554345-7','https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',false),
    User('Amin','54400-8554345-8','https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',false),


  ];
  List<User>_foundedUsers = [];

  @override
  void initState(){
    super.initState();
    setState(() {
      _foundedUsers = _users;
    });
  }
  onSearch(String search) {
    setState(() {
      _foundedUsers = _users.where((user) => user.name.toLowerCase().contains(search)).toList();
    });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blueAccent,
        title: Column(
            children: [

        Container(
          height: 40,
          width: 800,
          child: TextField(
            onChanged: (value) => onSearch(value),
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black
                ),
                hintText: "Search users"
            ),
          ),
        ),

      ]
    ),
        actions: [
          Row(
            children: [
              PopupMenuButton<String>(
                onSelected: (String value) {
                  // Handle menu item selection
                  switch (value) {
                    case 'Option 1':
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Voter_users()),
                      );
                      break;
                    // case 'Option 2':
                    // // Navigator.pushReplacement(
                    // //   context,
                    // //   MaterialPageRoute(builder: (context) => SplashScreen()),
                    // // );
                    //   break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Voters'),
                  ),
                  // PopupMenuItem<String>(
                  //   value: 'Option 2',
                  //   child: Text('Admins'),
                  // ),

                ],

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
margin: EdgeInsets.only(right: 30),
                    child: Text('Candidates',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
              ),

            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: 1,
        destinations: [
          NavigationDestination(
              icon: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Admin_Home(users)
                    //     ));
                  },
                  child: Icon(Icons.home)), label: 'Home'),
          NavigationDestination(
              icon: InkWell(
                  child: Icon(Icons.supervised_user_circle_sharp)), label: 'Users'),
          NavigationDestination(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          NavigationDestination(
              icon: InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => admin_ProfilePage()
                    //     ));
                  },
                  child: Icon(Icons.person)), label: 'Profile'),
        ],
      ),
      body:
      Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _foundedUsers.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                userComponent(user: _foundedUsers[index]),
                Divider(color: Colors.black,), // Add Divider after each userComponent
              ],
            );
          },
        ),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(user.image),
                    )
                ),
                SizedBox(width: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5,),
                      Text(user.cnic, style: TextStyle(color: Colors.grey[500])),
                    ]
                )
              ]
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: user.isFollowedByMe ? Colors.red.shade900 : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: user.isFollowedByMe ? Colors.black : Colors.black,)
                ),
                child: Center(
                    child: Text(user.isFollowedByMe ? 'Removed' : 'Delete', style: TextStyle(color: user.isFollowedByMe ? Colors.black : Colors.black))
                )
            ),
          )
        ],
      ),
    );
  }
}


class Voter_users extends StatefulWidget {
  const Voter_users({Key? key}) : super(key: key);

  @override
  _VoterPageState createState() => _VoterPageState();
}

class _VoterPageState extends State<Voter_users> {
  List<User>_users = [
    User('Kathleen Mcdonough', '@kathleen', 'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da', false),
    User('Kathleen Mcdonough', '@kathleen', 'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da', false),
    User('Kathleen Mcdonough', '@kathleen', 'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da', false),
    User('Kathleen Mcdonough', '@kathleen', 'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da', false),
    User('Kathleen Mcdonough', '@kathleen', 'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da', false),


  ];
  List<User>_foundedUsers = [];

  @override
  void initState(){
    super.initState();
    setState(() {
      _foundedUsers = _users;
    });
  }
  onSearch(String search) {
    setState(() {
      _foundedUsers = _users.where((user) => user.name.toLowerCase().contains(search)).toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.blueAccent,
        title: Column(
            children: [

              Container(
                height: 38,
                child: TextField(
                  onChanged: (value) => onSearch(value),
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                      ),
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black
                      ),
                      hintText: "Search users"
                  ),
                ),
              ),

            ]
        ),
        actions: [
          Row(
            children: [
              PopupMenuButton<String>(
                onSelected: (String value) {
                  // Handle menu item selection
                  switch (value) {
                    case 'Option 1':
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CandidateUsers()),
                      );
                      break;
                  // case 'Option 2':
                  // // Navigator.pushReplacement(
                  // //   context,
                  // //   MaterialPageRoute(builder: (context) => SplashScreen()),
                  // // );
                  //   break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Candidates'),
                  ),
                  // PopupMenuItem<String>(
                  //   value: 'Option 2',
                  //   child: Text('Admins'),
                  // ),

                ],

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text('Voters',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
              ),

            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: 1,
        destinations: [
          NavigationDestination(
              icon: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Admin_Home()
                    //     ));
                  },
                  child: Icon(Icons.home)), label: 'Home'),
          NavigationDestination(
              icon:
              InkWell(
                  child: Icon(Icons.supervised_user_circle_sharp)), label: 'Users'),
          NavigationDestination(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          NavigationDestination(
              icon: InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => admin_ProfilePage()
                    //     ));
                  },
                  child: Icon(Icons.person)), label: 'Profile'),
        ],
      ),
      body:
      Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _foundedUsers.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                userComponent(user: _foundedUsers[index]),
                Divider(color: Colors.black,), // Add Divider after each userComponent
              ],
            );
          },
        ),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(user.image),
                    )
                ),
                SizedBox(width: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5,),
                      Text(user.cnic, style: TextStyle(color: Colors.grey[500])),
                    ]
                )
              ]
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: user.isFollowedByMe ? Colors.red.shade900 : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: user.isFollowedByMe ? Colors.black : Colors.black,)
                ),
                child: Center(
                    child: Text(user.isFollowedByMe ? 'Removed' : 'Delete', style: TextStyle(color: user.isFollowedByMe ? Colors.black : Colors.black))
                )
            ),
          )
        ],
      ),
    );
  }
}
