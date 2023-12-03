import 'package:app1/Views/Home_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return     MaterialApp(
    
      title: "Pawan'App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    
      home: HomeView(),
    
    );
  }
}