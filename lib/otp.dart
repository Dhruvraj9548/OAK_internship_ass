import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oak_internship_ass/email_pass.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class OTPDigitField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  OTPDigitField({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.0,
      height: 60.0,
      child: TextField(
        onChanged: onChanged,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _OTPScreenState extends State<OTPScreen> {
  List<String> otp = List.filled(4, '');

  void _onOTPEntered(String value, int index) {
    setState(() {
      otp[index] = value;
    });
  }

  void _onSubmitOTP() {
    String enteredOTP = otp.join();
    // Perform OTP verification logic here
    if (enteredOTP == '1234') {
      // OTP is correct, navigate to another screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailPassScreen()),
      );
    } else {
      // OTP is wrong, show error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Wrong OTP. Please try again.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'OTP Verification',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'We have sent a verification code to:',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '+91 - XXXXXXXXXX',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OTPDigitField(
                  value: otp[0],
                  onChanged: (value) => _onOTPEntered(value, 0),
                ),
                OTPDigitField(
                  value: otp[1],
                  onChanged: (value) => _onOTPEntered(value, 1),
                ),
                OTPDigitField(
                  value: otp[2],
                  onChanged: (value) => _onOTPEntered(value, 2),
                ),
                OTPDigitField(
                  value: otp[3],
                  onChanged: (value) => _onOTPEntered(value, 3),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSubmitOTP,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Didn't receive code? ",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                TextButton(onPressed:(){
                  Text('Just clickable');}
                    , child: Text("Resend Again.",
                      style: TextStyle(fontSize: 14.0, color: Colors.deepPurpleAccent),))

              ],
            ),
          ],
        ),
      ),
    );

  }


  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+1${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => EmailPassScreen()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}