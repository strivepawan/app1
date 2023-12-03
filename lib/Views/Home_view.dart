import 'package:app1/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      //appBar: AppBar(),
        body: SafeArea(
          child: CalculatorView()),
      );
  }
}