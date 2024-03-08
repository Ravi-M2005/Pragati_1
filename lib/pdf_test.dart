// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:file_picker/file_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String _text = '';
//   final reader = PdfReader(file.bytes!);
// final document = reader.readDocument();

//   // Load a PDF file from the local storage
//   Future<void> _loadPdf() async {
//   try {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       PlatformFile file = result.files.first;
// PdfDocument document = PdfDocument.createFromBytes(file.bytes!);
//       PdfTextExtractor extractor = PdfTextExtractor(document);
//       String text = extractor.extractText();
//       document.dispose();
//       setState(() {
//         _text = text;
//       });
//     }
//   } on Exception catch (e) {
//     // Handle errors like file picking cancelled or issues with PDF processing
//     print("Error loading PDF: $e");
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Reader'),
//       ),
//       body: Center(
//         child: _text.isEmpty
//             ? Text('No PDF file selected')
//             : SelectableText(
//                 _text,
//                 // Customize the selection toolbar options
//                 toolbarOptions: ToolbarOptions(
//                   copy: true,
//                   selectAll: true,
//                   // Add a custom option to go to chat
//                   customOptions: <CustomToolbarOption>[
//                     CustomToolbarOption(
//                       label: 'Go to chat',
//                       onPressed: () {
//                         // Handle the go to chat option
//                         print('Go to chat');
//                       },
//                     ),
//                   ],
//                 ),
//                 // Handle the selection changed event
//                 onSelectionChanged: (selection, cause) {
//                   // Print the selected text
//                   print(selection.textInside(_text));
//                 },
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _loadPdf,
//         tooltip: 'Pick PDF',
//         child: Icon(Icons.attach_file),
//       ),
//     );
//   }
// }
