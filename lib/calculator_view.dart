import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x=0;
  int y=0;
  num z=0; 

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late  final AppLifecycleListener _listener;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

  _listener = AppLifecycleListener(
    onShow: _onShow,
    onHide: _onHide,
    onResume: _onResume,
    onDetach: _onDetach,
    onInactive: _onInactive,
    onPause: _onPause,
    onRestart: _onRestart,
    onStateChange: _onStateChange,
  );

  }

  void _onShow () => print("onShow called");

  void _onHide () => print("onHide called");

  void _onResume () => print("OnResume caleed");
  
  void _onDetach () => print("OnDtech caleed");

  void _onInactive () => print("OnInactive caleed");

  void _onPause () => print("Onpause is called");

  void _onRestart () => print("onRestart caleld");

  void _onStateChange (AppLifecycleState state) { print("onStateChange caleed with the $state");}
  //   @override
  // Void dispose(){
  //   displayOneController.dispose();
  //   displayTwoController.dispose();
  //   _listener.dispose();
  //   super.dispose();

  // }
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child:  Column(
        children: [
          //calculator Display
          CalculatorDisplay(hint: "Enter a first Number",
          controller: displayOneController ),
          SizedBox(height: 20,),
          CalculatorDisplay(hint : "Enter a Second Number",
          controller: displayTwoController),
          SizedBox(
            height: 30,  
          ),
          Text(z.toString(),
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed:() {
                  setState(() {
                     z = num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;
                  });
                 
                },
                child: Icon(Icons.add),
                ),
              FloatingActionButton(
                onPressed:() {
                  setState(() {
                     z = num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
                  });
                  z = num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
              
                },
                child: Icon(CupertinoIcons.minus),
                ),
            FloatingActionButton(
                onPressed:() {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)! ;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
                ),
            FloatingActionButton(
                onPressed:() {
                setState(() {
                  z = num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;
                });
                },
                child: Icon(CupertinoIcons.divide),
                ),                
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                x=0;
                y=0;
                z=0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            child: const Text("Clear"),
            )
           
          //Expand
          // Calcultor Button
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    super.key,
    this.hint = "Enter a Number",required this.controller,
  });
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus:true,
      
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white
        )
      ),
    );
  }
}