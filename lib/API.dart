// ignore_for_file: file_names

// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:cookie_jar/cookie_jar.dart';


// String Host = "http://127.0.0.1:1803";

// class ChatAPI {
//   var files;
//   String? csrfToken;
//   final dio = Dio();
//   final cookieJar = CookieJar();
//   Map<String, dynamic> headers = {'Content-Type': 'application/json', 'set-cookie':null};
//   Map<String, dynamic> recievedData = {};

//   @override
//   void initState() {
//     dio.interceptors.add(CookieManager(cookieJar));
//   }

//   // Gets the CSRF token for further processing.
//   Future<void> getCSRF() async {
//     String endpoint = "$Host/FileAPI";


//     headers["getCSRF"] = 1;

//     Response response = await dio.get(endpoint, options: Options(
//       headers: headers,
//     ));

//     String setCookieHeader = '';
//     for (String header in response.headers['set-cookie']!) {
//       if (header.startsWith('csrftoken=')) {
//         setCookieHeader = header;
//         break;
//       }
//     }

//     csrfToken = setCookieHeader.split(';')[0].split('=')[1];
//     headers["Cookie"] = 'csrftoken=$csrfToken';
//     headers["X-CSRFToken"] = csrfToken;

//   }

//   // Sends a file that is being uploaded onto the website backend for processing.
//   Future sendFile(file, String fileName) async {
//     String endpoint = "$Host/FileAPI";


//     headers["FileName"] = fileName;
//     headers["UploadedFile"] = file;

//     Map data = {};
//     String base64file = base64Encode(((await file.readAsBytes()).buffer.asUint8List())); //Change the image.

//     data['file']= base64file;

//     Response response = await dio.post(endpoint, data: jsonEncode(data), options: Options(
//       headers: headers,
//     ));

//     // Sends file for processing.
//   }


//   // Gets a text that has been given by user and sends it to backend
//   // Receives appropriate context and answer from backend and sends it to the
//   // app.

//   Future<(String, String)> communicate(String text) async {
//     String endpoint = "$Host/TextAPI";

//     Response response = await dio.post(endpoint, data: jsonEncode({"text" : text}), options: Options(
//       headers: headers,
//     ));

//     String reply = response.data["aiMsg"];//"AI Based Replies not configured yet.";
//     String context = response.data["context"];
//     print(response.data["page_no"]);

//     return (reply, context);
//   }


// }