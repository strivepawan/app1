import 'package:app1/App/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("Calculator Test", (WidgetTester tester)  async {
    await tester.pumpWidget(const MyApp());
    expect(find.byWidget( Text("0")), findsOneWidget);
  });
}