import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:income_category/main.dart';

class FixCategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FixCategoryPageState();
}

class _FixCategoryPageState extends State<FixCategoryPage> {

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
               ),
             ),
             SizedBox(height: 80,),
             Container(
               child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                     width: 100,
                       height: 50,
                       child: ElevatedButton(
                         child: Text('削除', style: TextStyle(fontSize: 25)),
                         style: ElevatedButton.styleFrom(
                           primary: Colors.red
                         ),
                         onPressed: () { Navigator.pop(context );}
                       )
                   ),
                   Container(
                     width: 100,
                       height: 50,
                       child: ElevatedButton(
                         child: Text('更新', style: TextStyle(fontSize: 25)),
                         style:ElevatedButton.styleFrom(
                           primary: Colors.blue
                         ),
                         onPressed: () { Navigator.pop(context,
                         MaterialPageRoute(builder: (context) => MyHomePage()),
                         );},
                       )
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     );
  }

}
