// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:income_category/model/income_category.dart';
// import 'package:income_category/model/income_category_db_helper.dart';
//
// class AddCategoryPage extends StatefulWidget {
//   final IncomeCategories? incomecategories;
//
//   const AddCategoryPage({Key? key, this.incomecategories}) :super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _AddCategoryPageState();
// }
//
// class _AddCategoryPageState extends State<AddCategoryPage>{
//
//   late int income_category_code;
//   late String income_category_name;
//   late DateTime income_category_created_at;
//   late DateTime income_category_updated_at;
//   late String _text;
//
//   @override
//   void initState() {
//     super.initState();
//     income_category_code = widget.incomecategories?.income_category_code ?? 0;
//     income_category_name = widget.incomecategories?.income_category_name ?? '';
//     income_category_created_at = widget.incomecategories?.income_category_created_at ?? DateTime.now();
//     income_category_updated_at = widget.incomecategories?.income_category_updated_at ?? DateTime.now();
//     _text = '';
//   }
//
//   void createOrUpdateIncomeCategory() async {
//     final isUpdate = (widget.incomecategories != null);
//
//     if(isUpdate) {
//       await updateIncomeCategory();
//     } else {
//       await createIncomeCategory();
//     }
//     Navigator.of(context).pop();
//   }
//
//   Future updateIncomeCategory() async {
//     final incomecategory = widget.incomecategories!.copy(
//       income_category_name: income_category_name,
//       income_category_updated_at: income_category_updated_at
//     );
//     await IncomeCategoryDbHelper.incomecategoryinstance.incomecategoryupdate(incomecategory);
//   }
//
//   Future createIncomeCategory() async {
//     final incomecategory = IncomeCategories(
//         income_category_code: income_category_code,
//         income_category_name: income_category_name,
//         income_category_created_at: income_category_created_at,
//         income_category_updated_at: income_category_updated_at,
//     );
//     await IncomeCategoryDbHelper.incomecategoryinstance.incomecategoryinsert(incomecategory);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70.50),
//         child: AppBar(
//           title: Text('収入カテゴリ', style: TextStyle(fontSize: 25),),
//           centerTitle: true,
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: 100,),
//             Text('カテゴリ名', style: TextStyle(fontSize: 30),),
//             SizedBox(height: 100,),
//             Container(
//               width: 300,
//               // child: Column (
//               //   children: <Widget>[
//               //     child: SingleChildScrollView(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: 15,
//                         ),
//                       ),
//                       onChanged: (String value) {
//                         setState(() {
//                           _text = value;
//                         });
//                       },
//                     ),
//
//               //     )
//               //   ],
//               // ),
//             ),
//             SizedBox(height: 80,),
//             Container(
//               width: 100,
//               height: 50,
//               child: ElevatedButton(
//                 child: Text('追加',style: TextStyle(fontSize: 25),),
//                 onPressed: createOrUpdateIncomeCategory,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
