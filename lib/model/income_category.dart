// Expensesテーブルの定義
import 'income_category_db_helper.dart';
import 'package:intl/intl.dart';


class IncomeCategories {
  int income_category_code;
  String income_category_name;
  DateTime income_category_created_at;
  DateTime income_category_updated_at;

  IncomeCategories({
    required this.income_category_code,
    required this.income_category_name,
    required this.income_category_created_at,
    required this.income_category_updated_at,
  });

// 更新時のデータを入力項目からコピーする処理
  IncomeCategories copy({
    int? income_category_code,
    String? income_category_name,
    DateTime? income_category_created_at,
    DateTime? income_category_updated_at,
  }) =>
      IncomeCategories(
        income_category_code: income_category_code ?? this.income_category_code,
        income_category_name: income_category_name ??
            this.income_category_name,
        income_category_created_at: income_category_created_at ?? this.income_category_created_at,
        income_category_updated_at: income_category_updated_at ?? this.income_category_updated_at,
      );

  static IncomeCategories fromJson(Map<String, Object?> json) =>
      IncomeCategories(
        income_category_code: json[columnIncomeCategoryCode] as int,
        income_category_name: json[columnIncomeCategoryName] as String,
        income_category_created_at: DateTime.parse(
            json[columnIncomeCategoryCreatedAt] as String),
        income_category_updated_at: DateTime.parse(
            json[columnIncomeCategoryUpdatedAt] as String),
      );

  Map<String, Object> toJson() =>
      {
        columnIncomeCategoryName: income_category_name,
        columnIncomeCategoryCreatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(
            income_category_created_at),
        columnIncomeCategoryUpdatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(
            income_category_updated_at),
      };
}