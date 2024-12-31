import 'package:flutter/material.dart';
import 'package:joylab/meme/list_meme.dart';

class SavedMemesScreen extends StatelessWidget {
  final List<Meme> savedMemes;

  const SavedMemesScreen({Key? key, required this.savedMemes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Memes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: savedMemes.isEmpty
            ? Center(child: Text("No saved memes yet!"))
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: savedMemes.length,
          itemBuilder: (context, index) {
            Meme meme = savedMemes[index];
            return GestureDetector(
              onTap: () => _showMemeDetails(context, meme),
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        meme.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      meme.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showMemeDetails(BuildContext context, Meme meme) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(meme.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(meme.imageAsset),
              SizedBox(height: 10),
              Text(meme.description),
              SizedBox(height: 10),
              Text('Creator: ${meme.creator}'),
              Text('Year: ${meme.year}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
