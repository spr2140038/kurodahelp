import 'package:flutter/material.dart';
import 'package:income_category/add_catgory.dart';
import 'package:income_category/fix_category.dart';


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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> categoryList = [];

  key(List<String> categoryList) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.50),
          child: AppBar(
            title: Text('収入カテゴリ', style: TextStyle(fontSize: 25),),
            centerTitle: true,
          ),
        ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 390,
              color: Colors.cyan,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(categoryList[index], style: TextStyle(fontSize: 20),),
                            trailing: IconButton(onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => FixCategoryPage()));
                            },icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        );
                  },
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: 120,
              height: 60,
              child: ElevatedButton(
                child: Text('カテゴリ追加', style: TextStyle(fontSize: 13),),
                onPressed: () async {final newList = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return AddCategoryPage();
                  }),
                );
                if (newList != null) {
                  setState(() {
                    categoryList.add(newList);
                  });
                }
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
