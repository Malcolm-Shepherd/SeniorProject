import 'package:flutter/material.dart';

class NotesDisplay extends StatelessWidget {
  const NotesDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "locations Menu",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => noteDialog(context)),
          )
        ],
      ),
      body: Container(),
    );
  }
}

Dialog noteDialog(BuildContext context) {
  return Dialog(
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("data"),
          TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Note title'),
          ),
          TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Note body',
                isDense: true,
                alignLabelWithHint: false),
            maxLines: null,
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    ),
  );
}
