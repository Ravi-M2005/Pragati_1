// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

import 'package:pragati_a/login_page.dart';
import 'signup_page.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  File? _file;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool isBotTyping = false;
  FocusNode _textFieldFocus = FocusNode();
  bool _showMicIcon = true;

  void _handleLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _handleSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _textFieldFocus.addListener(_onTextFieldFocusChange);
  }

  void _onTextFieldFocusChange() {
    setState(() {
      _showMicIcon = !_textFieldFocus.hasFocus;
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _textFieldFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 159, 21, 184),
          title: Center(
            child: Text(
              'AI Chat Assistant',
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          // leading: Builder(
          //   builder: (context) => IconButton(
          //     icon: Icon(Icons.menu),
          //     onPressed: () => Scaffold.of(context).openDrawer(),
          //   ),
          // ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.login,
              ),
              onPressed: () {
                // Navigate to the sign-up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.person_add,
            //   ),
            //   onPressed: _handleSignup,
            // ),
          ],
        ),
        // floatingActionButton: Icon(Icons.star),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assests/images/Purple Element.jpeg"), // Replace with your asset image
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true, // Display messages in reverse order
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  },
                ),
              ),
              _buildMessagePrompt(),
              _buildMessageComposer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessagePrompt() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: _messages.isNotEmpty && !_messages.first.isUser
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isBotTyping
                    ? Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 8.0),
                          Text('AI Assistant is typing...'),
                        ],
                      )
                    : Container(),
                SizedBox(height: 5.0),
              ],
            )
          : Container(),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          // IconButton(
          //   icon: Icon(Icons.upload_file),
          //   color: Colors.purple,
          //   onPressed: _pickFile,
          // ),
          Expanded(
            child: TextField(
              controller: _messageController,
              focusNode: _textFieldFocus,
              textInputAction: TextInputAction.send,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a FAQ Prompt...',
              ),
            ),
          ),
          if (_showMicIcon)
            IconButton(
              icon: Icon(
                Icons.mic,
                color: Colors.purple,
              ),
              onPressed: () {
                // Handle microphone button press
              },
            ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.purple,
            ),
            onPressed: () {
              _handleSubmitted(_messageController.text);
            },
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) async {
    _messageController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    _handleAIDummyResponse();
  }

  void _handleAIDummyResponse() {
    setState(() {
      isBotTyping = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      ChatMessage aiMessage = ChatMessage(
        text: "This is a dummy AI response.",
        isUser: false,
      );

      setState(() {
        isBotTyping = false;
        // _messages.removeAt(0); // Remove the typing prompt
        _messages.insert(0, aiMessage);
      });
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        //crossAxisAlignment: CrossAxisAlignment.start,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isUser
                ? CircleAvatar(
                    child: Icon(Icons.person),
                  )
                : CircleAvatar(
                    child: Icon(Icons.android),
                  ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isUser ? 'You' : 'AI Assistant',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: isUser ? Colors.yellow : Colors.blue[200],
                        borderRadius: BorderRadius.circular(
                            10.0)), // Use a ternary operator to check if the message is from the user or the AI assistant
                    child: Text(text),
                  ),
                  if (!isUser) // Only show the button when the message is from the AI
                    Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text('Click here to view Context'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Context'), // Customize the title
                                content: Text(
                                    'Enter the additional context for your message:' *
                                        50,
                                    style: TextStyle(fontSize: 16.0)),
                              ),
                            );
                          },
                          // onPressed: () {
                          //   // Use showDialog to open a dialog
                          //   showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       // Return a widget that will be displayed as the dialog
                          //       return SimpleDialog(
                          //         title: Text('Context'),
                          //         //content: Text('This is the context of the current screen'),
                          //       );
                          //     },
                          //   );
                          // },
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
