<<<<<<< HEAD
// ignore_for_file: unused_import, override_on_non_overriding_member, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_constructors, unused_element, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields

import 'dart:io';
=======
// ignore_for_file: prefer_const_constructors, unused_element, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields
>>>>>>> b370de5672991e7ed0444725f079771d6567cb3c

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'Chatbot.dart';

Color _gold = Color(0xFFD4A064);
Color _white = Color(0xFFF2F5F8);
Color _blue = Color(0xFF1C2541);
Color _red = Color(0xFFCC4E5C);

<<<<<<< HEAD
// ChatAPI api = new ChatAPI();

=======
>>>>>>> b370de5672991e7ed0444725f079771d6567cb3c
class Myupload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // Add your theme configurations here
      ),
      home: UploadPage(),
    );
  }
}

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String _fileName = '';
  List<String> _uploadedFileNames = [];

  @override
  // void initState() {
  //   // api.getCSRF();
  // }

  Future pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      if (mounted) {
        setState(() {
          _fileName = result.files.single.name;
          _uploadedFileNames.add(_fileName);

          var path = result.files.first.path;
          final File _file = File(path!);
          //  api.sendFile(_file, _fileName);
        });
      }
    } else {
      // User canceled the picker
    }
  }

  void _handleUpload(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _blue,
<<<<<<< HEAD
        title: Text(''),
      ),
      body: Container(
        color: _blue,
=======
        title: Text('Upload Page'),
      ),
      body: Container(
        decoration: BoxDecoration(color: _blue),
>>>>>>> b370de5672991e7ed0444725f079771d6567cb3c
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Upload your documents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                await pickFile();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  color: _white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
<<<<<<< HEAD
                      Icon(
                        Icons.upload,
                        size: 50,
                        color: _blue,
                      ),
                      Center(
                        child: Text(
                          'Upload Your Files Here',
                          style: TextStyle(color: _blue, fontSize: 20.0),
                        ),
                      ),
=======
                      Icon(Icons.upload, size: 50, color: _gold),
                      Center(
                        child: Text(
                          'Upload Your Files Here',
                          style: TextStyle(color: _gold, fontSize: 20.0),
                        ),
                      ),
>>>>>>> b370de5672991e7ed0444725f079771d6567cb3c
                      if (_fileName.isNotEmpty)
                        Text(
                          'Uploaded File: $_fileName',
                          style: TextStyle(fontSize: 16),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
<<<<<<< HEAD
                  backgroundColor: MaterialStateProperty.all(_gold),
=======
                  backgroundColor: MaterialStateProperty.all(_white),
>>>>>>> b370de5672991e7ed0444725f079771d6567cb3c
                ),
                onPressed: () {
                  _handleUpload(context);
                },
                child: Text(
                  'Ready to discuss',
<<<<<<< HEAD
                  style: TextStyle(color: _blue),
=======
                  style: TextStyle(color: _gold),
>>>>>>> b370de5672991e7ed0444725f079771d6567cb3c
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _uploadedFileNames.length,
                itemBuilder: (BuildContext context, int index) {
                  final fileName = _uploadedFileNames[index];
                  return ListTile(
                    title: Text(fileName),
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Center(
        child: Text('This is the Chat Screen'),
      ),
    );
  }
}
