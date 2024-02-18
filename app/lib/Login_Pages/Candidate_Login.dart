import 'package:app/SignUp_Pages/Candidate_SignUp.dart';
import 'package:flutter/material.dart';

import '../apiController.dart';

class CandidateLoginPage extends StatefulWidget {
  @override
  _CandidateLoginPageState createState() => _CandidateLoginPageState();
}

class _CandidateLoginPageState extends State<CandidateLoginPage> {
  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid E-mail';
    }
    return null;
  }

  String? _validateCNIC(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp cnicRegExp = RegExp(r'^\d{5}-\d{7}-\d{1}$');
    if (!cnicRegExp.hasMatch(value)) {
      return 'Please enter a valid CNIC';
    }
    return null;
  }

  final apiController apicontroller = apiController();

  void _submitform() async {
    if (_formKey.currentState!.validate()) {
      apicontroller.loginCandidates(c.text, e.text, p.text,context);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  var e = TextEditingController();
  var p = TextEditingController();
  var c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.asset("assets/images/positive-vote.png"),
                  ),
                  Container(height: 12),
                  Text(
                    "WE-VOTE",
                    style: TextStyle(
                      color: Color(0xff937DE2),
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      fontFamily: 'Mainn',
                    ),
                  ),
                  Container(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Mainn',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Here to get ',
                              style: TextStyle(color: Colors.blue, fontSize: 50),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Mainn',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Welcomed! ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(height: 10),
                  Row(
                    children: [
                      Text(
                        'Login Here',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(height: 5),
                  Wrap(
                    children: [
                      Text(
                        'Login to your account and start viewing candidate profiles and cast vote for your better future',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: c,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.black45, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      prefixIcon: Icon(Icons.add_card),
                      hintText: "Enter your CNIC",
                    ),
                    validator: _validateCNIC,
                  ),
                  Container(height: 12),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: e,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.black45, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Email",
                    ),
                    validator: _validateEmail,
                  ),
                  Container(height: 12),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: p,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.black45, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      hintText: "Enter password",
                    ),
                    obscureText: !_passwordVisible,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Please enter a password');
                      }
                      return null;
                    },
                  ),
                  Container(height: 12),
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _submitform();
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            print('Text Clicked');
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('OR', style: TextStyle(fontSize: 16)),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CandidateSignUpPage(title: '',)
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      child: Text('Sign up'),
                    ),
                  ),
                  Container(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
