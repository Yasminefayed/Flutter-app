import 'package:flutter/material.dart';
import 'package:untitled3/Jar.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(rec1());
}

class rec1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Text(
              //' ',),

              //Text('Here is Recommendations from us',style: TextStyle(
              //fontSize: 24.0,
              //fontWeight: FontWeight.bold,
              //color: Color(0xffb11226),
              // ),),
              ListView(
                shrinkWrap: true,
                children: [
                  LongCourseCard(
                    category: 'Music',
                    title: 'Learn to Play the Piano',
                    description: 'Master the art of playing the piano with our comprehensive course.',
                    backgroundColor: Colors.blue,
                  ),
                  LongCourseCard(
                    category: 'Food',
                    title: 'Culinary Delights: From Basics to Gourmet',
                    description: 'Embark on a culinary journey and learn to cook from the basics to gourmet dishes.',
                    backgroundColor: Colors.green,
                  ),
                  LongCourseCard(
                    category: 'Books',
                    title: 'Explore World Literature',
                    description: 'Dive into the world of literature with our carefully curated reading list and discussions.',
                    backgroundColor: Colors.orange,
                  ),
                  LongCourseCard(
                    category: 'Quotes',
                    title: 'Inspiration and Wisdom',
                    description: 'Discover timeless wisdom through a collection of inspirational quotes.',
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