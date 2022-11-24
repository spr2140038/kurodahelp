import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage>{

  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.50),
        child: AppBar(
          title: Text('収入カテゴリ', style: TextStyle(fontSize: 25),),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Text('カテゴリ名', style: TextStyle(fontSize: 30),),
            SizedBox(height: 100,),
            Container(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    _text = value;
                  });
                },
              ),
            ),
            SizedBox(height: 80,),
            Container(
              width: 100,
              height: 50,
              child: ElevatedButton(
                child: Text('追加',style: TextStyle(fontSize: 25),),
                onPressed: () { Navigator.of(context).pop(_text);}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
