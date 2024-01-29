import 'package:flutter/material.dart';

void main() {
  runApp(DiaryApp());
}

class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiaryPage(),
    );
  }
}

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final List<String> entries = [];

  TextEditingController entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Diary'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return DiaryEntryCard(
                  entry: entries[index],
                  onDelete: () {
                    // Delete the entry when the delete button is pressed
                    setState(() {
                      entries.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: entryController,
              maxLines: 5, // Allow multiple lines for larger entries
              decoration: InputDecoration(
                labelText: 'Write your diary entry',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add a new entry to the diary
              setState(() {
                entries.add(entryController.text);
                entryController.clear();
              });
            },
            child: Text('Add Entry'),
          ),
        ],
      ),
    );
  }
}

class DiaryEntryCard extends StatelessWidget {
  final String entry;
  final VoidCallback onDelete;

  DiaryEntryCard({required this.entry, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Diary Entry',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                  color: Colors.red,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              entry,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
