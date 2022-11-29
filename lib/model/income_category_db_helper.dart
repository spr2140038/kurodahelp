import 'package:income_category/model/income_category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String columnIncomeCategoryCode = '_income_category_code';
const String columnIncomeCategoryName = 'income_category_name';
const String columnIncomeCategoryCreatedAt = 'income_category_created_at';
const String columnIncomeCategoryUpdatedAt = 'income_category_updated_at';

const List<String> incomecategorycolumns = [
  columnIncomeCategoryCode,
  columnIncomeCategoryName,
  columnIncomeCategoryCreatedAt,
  columnIncomeCategoryUpdatedAt,
];

class IncomeCategoryDbHelper {
  // DbHelperをinstance化する
  static final IncomeCategoryDbHelper incomecategoryinstance = IncomeCategoryDbHelper._createInstance();
  static Database? _incomecategorydatabase;

  IncomeCategoryDbHelper._createInstance();

  // databaseをオープンしてインスタンス化する
  Future<Database> get incomecategorydatabase async {
    return _incomecategorydatabase ??= await _initDB(); // 初回だったら_initDB()=DBオープンする
  }

  // データベースをオープンする
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'incomecategories.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onIncomeCategoryCreate, // cats.dbがなかった時の処理を指定する（DBは勝手に作られる）
    );
  }

  Future _onIncomeCategoryCreate(Database database, int version) async {
    //catsテーブルをcreateする
    await database.execute('''
      CREATE TABLE incomecategories(
        _income_category_code INTEGER PRIMARY KEY AUTOINCREMENT,
        income_category_name TEXT,
        income_category_created_at TEXT,
        income_category_updated_at TEXT
      )
    ''');
  }

  Future<List<IncomeCategories>> selectAllIncomeCategories() async {
    final db = await incomecategoryinstance.incomecategorydatabase;
    final incomeCategoriesData = await db.query('incomecategories');          // 条件指定しないでcatsテーブルを読み込む

    return incomeCategoriesData.map((json) => IncomeCategories.fromJson(json)).toList();    // 読み込んだテーブルデータをListにパースしてreturn
  }

  Future<IncomeCategories> incomeCategoryData(int id) async {
    final db = await incomecategoryinstance.incomecategorydatabase;
    var incomecategory = [];
    incomecategory = await db.query(
      'incomecategories',
      columns: incomecategorycolumns,
      where: '_income_category_code = ?',                     // 渡されたidをキーにしてcatsテーブルを読み込む
      whereArgs: [id],
    );
    return IncomeCategories.fromJson(incomecategory.first);      // 1件だけなので.toListは不要
  }

  Future incomecategoryinsert(IncomeCategories incomecategories) async {
    final db = await incomecategorydatabase;
    return await db.insert(
        'incomecategories',
        incomecategories.toJson()                         // cats.dartで定義しているtoJson()で渡されたcatsをパースして書き込む
    );
  }

  Future incomecategoryupdate(IncomeCategories incomecategories) async {
    final db = await incomecategorydatabase;
    return await db.update(
      'incomecategories',
      incomecategories.toJson(),
      where: '_income_category_code = ?',                   // idで指定されたデータを更新する
      whereArgs: [incomecategories.income_category_code],
    );
  }

  Future incomecategorydelete(int id) async {
    final db = await incomecategoryinstance.incomecategorydatabase;
    return await db.delete(
      'incomecategories',
      where: '_income_category_code = ?',                   // idで指定されたデータを削除する
      whereArgs: [id],
    );
  }
}