import 'package:flutter/material.dart';
import 'pages/friend_list_page.dart';

void main(){
  runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Favorite Friend',
       debugShowCheckedModeBanner: false,
       home: FriendListPage(),
     );
   }
 }
