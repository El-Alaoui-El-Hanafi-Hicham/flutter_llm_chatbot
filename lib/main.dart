import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'chat_screen.dart';
import 'chat_provider.dart';

Future<void> main() async {
  // Load .env file ONCE before running the app
  await dotenv.load(fileName: ".env");

  runApp(
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MaterialApp(
        home: ChatScreen(),
      ),
    ),
  );
}