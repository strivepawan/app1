import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      
          color: Colors.indigo,
          child:Center(child: const Text('Pawan vs Amaan',
          style:TextStyle(fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white),
          )
          ),
          
        ),
      );
  }
}