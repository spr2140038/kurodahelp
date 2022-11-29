import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:income_category/view/income_category_fix.dart';
import 'package:income_category/view/income_category_add.dart';
import '../model/income_category.dart';
import '../model/income_category_db_helper.dart';

class IncomeCategoryList extends StatefulWidget {
  // final int id;
  const IncomeCategoryList({Key? key}) : super(key: key);

  @override
  State<IncomeCategoryList> createState() => _IncomeCategoryListPageState();
}

class _IncomeCategoryListPageState extends State<IncomeCategoryList> {
  late IncomeCategories incomecategories;
  // late List<String> categoryList = [];
  // key(List<String> categoryList) {}
  List<IncomeCategories> incomeCategoryList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getIncomeCategoriesList();
    // incomeCategoryData();
    // incomecategories = IncomeCategories();
  }

  Future getIncomeCategoriesList() async {
    setState(() => isLoading = true );
    incomeCategoryList = await IncomeCategoryDbHelper.incomecategoryinstance.selectAllIncomeCategories();
    setState(() => isLoading = false);
  }

  // Future incomeCategoryData() async {
  //   setState(() => isLoading = true);
  //   incomecategories = await IncomeCategoryDbHelper.incomecategoryinstance.incomeCategoryData(widget.id);
  //   setState(() => isLoading = false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.50),
        child: AppBar(
          // actions: [
          //   IconButton(
          //     /*
          //         onPressed: () async {
          //           await Navigator.of(context).push(
          //             MaterialPageRoute(
          //               builder: (context) => AddCategoryPage(
          //               ),
          //             ),
          //           );
          //         },
          //
          //          */
          //     onPressed: () async {
          //       final newList = await Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context) {
          //               return AddCategoryPage();
          //             }
          //         ),
          //       );
          //       if (newList != null) {
          //         setState(() {
          //           IncomeCategoryList.add(newList);
          //         });
          //       }
          //     },
          //     icon: Icon(Icons.add),)
          // ],
          title: Text('収入カテゴリ', style: TextStyle(fontSize: 25),),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 500,
              color: Colors.cyan,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: incomeCategoryList.length,
                  itemBuilder: (context, index) {
                    final incomecategory = incomeCategoryList[index];
                    return Card(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Text(incomecategory.income_category_name,style: TextStyle(fontSize: 40),),
                            ],
                          ),
                        ),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => FixCategoryPage(id: incomecategory.income_category_code)
                              // builder: (context) => FixCategoryPage(
                              //   incomecategories: incomecategories, id: 1,
                              // )
                            ),
                          );
                          getIncomeCategoriesList();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: 120,
              height: 60,
              child: ElevatedButton(
                child: Text('カテゴリ追加', style: TextStyle(fontSize: 13),),
                onPressed: () async {
                  final newList = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return AddCategoryPage();
                    }),
                  );
                  if (newList != null) {
                    setState(() {
                      incomeCategoryList.add(newList);
                    });
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
