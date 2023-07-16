import 'package:flutter/material.dart';

class EmailPassScreen extends StatefulWidget {
  @override
  _EmailPassScreenState createState() => _EmailPassScreenState();
}

class _EmailPassScreenState extends State<EmailPassScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Only show the back button
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextView
            Text(
              'Just a step away !',
              style: TextStyle(fontSize: 20,),
            ),
            SizedBox(height: 16),

            // First TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Full name*',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Second TextField
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email ID*',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Button at the bottom
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent,
              ),
              child: Text("Let's Start"),
            ),
          ],
        ),
      ),
    );
  }
}
