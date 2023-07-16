import 'package:flutter/material.dart';
import 'package:oak_internship_ass/LoginPage.dart';
import 'package:oak_internship_ass/introSplashScreen.dart';
import 'package:oak_internship_ass/main.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walkthrough Screen',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: introSplashScreen(),
    );
  }
}

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _titles = [
    'Get Organized',
    'Create Tasks',
    'Mark as Complete',
  ];
  final List<String> _descriptions = [
    'TaskMaster helps you stay on top of your tasks and boost productivity.',
    'Tap the "+" button to add a new task. Enter a title and optional details.',
    'Swipe right on a task to mark it as complete.',
  ];
  final List<String> _images = [
    'assets/png files/Illistration 2.png',
    'assets/png files/Healthy options-pana.png',
    'assets/png files/Onboarding Illustration 3.png',
  ];
  final List<Size> _imageSizes = [
    Size(315.0, 185.0),
    Size(280.0, 280.0),
    Size(242.0, 242.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _titles.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return WalkthroughPage(
                title: _titles[index],
                description: _descriptions[index],
                image: _images[index],
                imageSize: _imageSizes[index],
              );
            },
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80.0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _titles.length; i++)
                    Indicator(active: i == _currentPage),
                ],
              ),
            ),
          ),
          Positioned(
            top: 150.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  _images[_currentPage],
                  width: _imageSizes[_currentPage].width,
                  height: _imageSizes[_currentPage].height,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16.0),
                Text(
                  _titles[_currentPage],
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  _descriptions[_currentPage],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (_currentPage == _titles.length - 1)
            Positioned(
              bottom: 16.0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    onPrimary: Colors.deepPurpleAccent,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Colors.deepPurpleAccent, width: 2.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Icon(
                          Icons.arrow_circle_right,
                          color: Colors.deepPurpleAccent,
                          size: 32.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (_currentPage != _titles.length - 1)
            Positioned(
              bottom: 16.0,
              left: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  if (_currentPage < _titles.length - 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  } else {
                    // TODO: Handle finish button action
                  }
                },
                icon: Icon(
                  Icons.arrow_circle_right,
                  color: Colors.deepPurpleAccent,
                  size: 32.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class WalkthroughPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Size imageSize;

  const WalkthroughPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class Indicator extends StatelessWidget {
  final bool active;

  const Indicator({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.deepPurpleAccent : Colors.grey,
      ),
    );
  }
}
