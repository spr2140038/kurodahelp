import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:income_category/model/income_category.dart';
import 'package:income_category/model/income_category_db_helper.dart';

class FixCategoryPage extends StatefulWidget {
  final IncomeCategories? incomecategories;
  final int id;
  const FixCategoryPage({Key? key, this.incomecategories, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FixCategoryPageState();
}

class _FixCategoryPageState extends State<FixCategoryPage> {
  late int income_category_code;
  late String income_category_name;
  late DateTime income_category_created_at;
  late DateTime income_category_updated_at;
  late IncomeCategories incomecategories;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // incomeCategoryData();
    income_category_code = widget.incomecategories?.income_category_code ?? 0;
    income_category_name = widget.incomecategories?.income_category_name ?? '';
    income_category_created_at = widget.incomecategories?.income_category_created_at ?? DateTime.now();
    income_category_updated_at = widget.incomecategories?.income_category_updated_at ?? DateTime.now();
  }

  // Future incomeCategoryData() async {
  //   setState(() => isLoading = true);
  //   incomecategories = await IncomeCategoryDbHelper.incomecategoryinstance.incomeCategoryData(widget.id);
  //   setState(() => isLoading = false);
  // }

  void createOrUpdateIncomeCategory() async {
    final isUpdate = (widget.incomecategories != null);

    if(isUpdate) {
      await updateIncomeCategory();
    } else {
      await createIncomeCategory();
    }
    Navigator.of(context).pop();
  }

  Future updateIncomeCategory() async {
    final incomecategory = widget.incomecategories!.copy(
      income_category_name: income_category_name,
      income_category_updated_at: income_category_updated_at,
    );
    await IncomeCategoryDbHelper.incomecategoryinstance.incomecategoryupdate(incomecategory);
    Navigator.of(context).pop();
  }

  Future createIncomeCategory() async {
    final incomecategory = IncomeCategories(
        income_category_code: income_category_code,
        income_category_name: income_category_name,
        income_category_created_at: income_category_created_at,
        income_category_updated_at: income_category_updated_at
    );
    await IncomeCategoryDbHelper.incomecategoryinstance.incomecategoryinsert(incomecategory);
  }

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
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.right,
                onChanged: (change_income_category_name) => setState(() => this.income_category_name = change_income_category_name),
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
                              backgroundColor: Colors.red
                          ),
                          onPressed: () async {
                            await IncomeCategoryDbHelper.incomecategoryinstance.incomecategorydelete(widget.id);
                            Navigator.of(context).pop;
                          },
                      ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('更新', style: TextStyle(fontSize: 25)),
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue
                      ),
                      onPressed: createOrUpdateIncomeCategory,
                      //     () async {
                      //   await Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (context) => MyHomePage(
                      //           incomecategories  : incomecategories,
                      //         ),
                      //     ),
                      //   );
                      //   incomeCategoryData();
                      // },
                    ),
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
