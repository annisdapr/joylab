import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joylab/meme/list_meme.dart';
import 'package:joylab/saved_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // List to store saved memes
  List<Meme> savedMemes = [];

  Future<void> downloadMeme(BuildContext context, Meme meme) async {
    try {
      final byteData = await rootBundle.load(meme.imageAsset);
      final buffer = byteData.buffer;

      final dir = await getTemporaryDirectory();
      final savePath = '${dir.path}/${meme.name}.jpg';

      File(savePath).writeAsBytesSync(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded ${meme.name} to $savePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joylab Meme Gallery"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedMemesScreen(savedMemes: savedMemes),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: memeList.length,
          itemBuilder: (context, index) {
            Meme meme = memeList[index];
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.download),

                onPressed: () => downloadMeme(context, meme),
                        ),
                        IconButton(
                          icon: Icon(
                            meme.isSaved ? Icons.favorite : Icons.favorite_border,
                            color: meme.isSaved ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              meme.isSaved = !meme.isSaved;
                              if (meme.isSaved) {
                                savedMemes.add(meme);
                              } else {
                                savedMemes.remove(meme);
                              }
                            });
                          },
                        ),
                      ],
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
