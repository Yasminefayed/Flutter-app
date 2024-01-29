import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteScreen(),
    );
  }
}

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> notes = [];

  List<String> filteredNotes = [];

  @override
  void initState() {
    super.initState();
    filteredNotes.addAll(notes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 8.0),
            Text('Your Jar',style: TextStyle(
              color: Color(0xffb11226),
              fontSize: 30
            ),),
            Icon(CupertinoIcons.doc_plaintext,size: 32,),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: NoteSearchDelegate(notes),
              );
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/backgrnd.jpeg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          ListView.builder(
            itemCount: filteredNotes.length,
            itemBuilder: (context, index) {
              return NoteTile(
                note: filteredNotes[index],
                onDelete: () {
                  setState(() {
                    notes.remove(filteredNotes[index]);
                    filteredNotes.removeAt(index);
                  });
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController noteController = TextEditingController();

        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            controller: noteController,
            decoration: InputDecoration(hintText: 'Enter your note...'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  String newNote = noteController.text;
                  if (newNote.isNotEmpty) {
                    notes.add(newNote);
                    filteredNotes.add(newNote);
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class NoteTile extends StatelessWidget {
  final String note;
  final VoidCallback onDelete;

  NoteTile({required this.note, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}

class NoteSearchDelegate extends SearchDelegate<String> {
  final List<String> notes;

  NoteSearchDelegate(this.notes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> searchResults = notes
        .where((note) => note.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return NoteTile(
          note: searchResults[index],
          onDelete: () {
            // You can add the delete functionality here as well if needed
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = notes
        .where((note) => note.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
          },
        );
      },
    );
  }
}