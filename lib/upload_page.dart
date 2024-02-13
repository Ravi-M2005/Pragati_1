import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'Chatbot.dart';

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

  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      if (mounted) {
        setState(() {
          _fileName = result.files.single.name;
          _uploadedFileNames.add(_fileName);
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
        title: Text('Upload Page'),
      ),
      body: Container(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload,
                      size: 50,
                      color: Colors.purple,
                    ),
                    Center(
                      child: Text(
                        'Upload Your Files Here',
                        style: TextStyle(color: Colors.purple, fontSize: 20.0),
                      ),
                    ),
                    if (_fileName.isNotEmpty)
                      Text(
                        'Uploaded File: $_fileName',
                        style: TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _handleUpload(context);
                },
                child: Text('Let\'s Go for Chat!'),
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

//----------------------------------------------------------------------------------------------------------

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'chatbot_ui.dart';
//
// class UploadDocumentPage extends StatefulWidget {
//   @override
//   _UploadDocumentPageState createState() => _UploadDocumentPageState();
// }
//
// class _UploadDocumentPageState extends State<UploadDocumentPage> {
//   File? _document;
//
//   Future<void> _uploadDocument() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _document = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   void _navigateToChatbot() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ChatbotUI()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Document'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _document == null
//                 ? Text('No document selected.')
//                 : Image.file(_document!),
//             ElevatedButton(
//               onPressed: _uploadDocument,
//               child: Text('Upload Document'),
//             ),
//             ElevatedButton(
//               // onPressed: _navigateToChatbot,
//               onPressed: MyApp(),
//               child: Text('Continue to Chatbot'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
