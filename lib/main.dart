import 'package:flutter/material.dart';
import 'package:flutterchatapp/screens/auth_screen.dart';
import 'package:flutterchatapp/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: Colors.indigoAccent,
        accentColor: Colors.redAccent,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.indigo,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        )
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged, builder: (ctx, userSnapshot) {
        if(userSnapshot.hasData) {
          return ChatScreen();
        }
        return AuthScreen();
      }),
    );
  }
}
