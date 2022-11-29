import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:income_category/view/income_category_list.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: IncomeCategoryList(id: 0),
      routes: <String, WidgetBuilder>{
        '/': (_) => const IncomeCategoryList(),
      },
    );
  }
}