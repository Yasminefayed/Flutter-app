import 'package:flutter/material.dart';
import 'package:untitled3/Jar.dart';
import 'package:untitled3/navbar_roots.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(rec());
}

class rec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  LongCourseCard(
                    category: 'Music',
                    title: 'After silence, that which comes nearest to expressing the inexpressible is music, check the link',
                    websiteUrl: 'https://www.youtube.com/watch?v=UJNksM0-23I',
                    backgroundColor: Colors.blue, description: '',
                  ),
                  LongCourseCard(
                    category: 'Food',
                    title: 'Dark chocolate lowers anxiety level , check the link below for more dessert recipes',
                    description: '',
                    websiteUrl: 'https://www.olivemagazine.com/recipes/collection/easy-dark-chocolate-recipes/',
                    backgroundColor: Colors.green,
                  ),
                  LongCourseCard(
                    category: 'Books',
                    title: 'Check out these books to find the one that describes you personality the most',
                    description: '',
                    backgroundColor: Colors.orange,
                    websiteUrl: 'https://www.verywellhealth.com/best-books-for-anxiety-7373428',
                  ),
                  LongCourseCard(
                    category: 'Quotes',
                    title: 'Your Quote of the day: "No need to hurry, no need to sparkle, no need to be anybody but onself"',
                    description: '',
                    backgroundColor: Colors.purple,
                  ),
                  LongCourseCard(
                    category: 'Your Jar',
                    title: ' You can type anything that comes up to your mind in your jar ',
                    description: '',
                    backgroundColor: Colors.pink,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteApp(), // Replace YourJarPage with the actual page you want to navigate to
                        ),
                      );
                    },

                  ),
                  // ... (other LongCourseCard widgets)
                ],
              ),

          ),

        ),
      );
  }
}

class LongCourseCard extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final String? websiteUrl; // Allow nullable for the website URL
  final Color backgroundColor;
  final VoidCallback? onTap;


  LongCourseCard({
    required this.category,
    required this.title,
    this.websiteUrl,
    required this.backgroundColor,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
      // Your onTap logic goes here
      // For example, navigate to another page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoteApp()),
      );
    },
    child: Card(
      margin: EdgeInsets.all(8.0),
      color: backgroundColor,

      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            if (websiteUrl != null)
              GestureDetector(
                onTap: () => _launchWebsite(context, websiteUrl!),
                child: Text(
                  'Visit Website',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        ),
      ),
    )
    );

  Future<void> _launchWebsite(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to launch the website.'),
        ),
      );
    }
  }
}