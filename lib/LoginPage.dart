import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oak_internship_ass/otp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSignupScreen(),
    );
  }
}

class LoginSignupScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  var phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 587,
            height: 243,
            child: Stack(
              children: [
                Image.asset(
                  'assets/png files/Vector 54.png', // Replace with your image path
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/png files/CMP Logo.png', // Replace with your image path
                        width: 107,
                        height: 107,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'CraftMyPlate',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Login or Signup',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixText: '+91 ',
                prefixStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () async{Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OTPScreen(_controller.text),
                ),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent,
              ),
              child: Text('Continue'),
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(bottom: 16.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'By continuing, you agree to our',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




//assets/png files/Vector 54.png
//assets/png files/CMP Logo.png