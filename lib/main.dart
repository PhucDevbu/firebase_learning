import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learning/screens/email_auth/login_screen.dart';
import 'package:firebase_learning/screens/home_screen.dart';
import 'package:firebase_learning/screens/phone_auth/sign_in_with_phone.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").get();
  // for(var doc in snapshot.docs){
  //   log(doc.data().toString());
  // }

  // Map<String,dynamic> newUserData = {
  //   "name": "Le",
  //   "email": "code@gmail.com"
  // };
  //
  // await _firestore.collection("users").doc("your_id").update({"email": "code1@gmail.com"});
  // log("User updated");
  //

  // await _firestore.collection("users").doc("your_id").delete();
  //
  // log("User deleted");


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:(FirebaseAuth.instance.currentUser != null) ? HomeScreen(): SignInWithPhone(),
    );
  }
}