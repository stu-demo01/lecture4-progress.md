import 'dart:convert';
import 'dart:io';

import 'package:async_json/async_json.dart';
import 'package:path/path.dart' as p;

Future<void> main(List<String> arguments) async {
  String raw;
  try {
    raw = await File(p.join('data', 'books.json')).readAsString();
  } on FileSystemException {
    print('数据文件缺失，请检查data/books.json');
    return;
  }
  final books = (jsonDecode(raw) as List)
      .map((e) => Book.fromJson(e as Map<String, dynamic>))
      .toList();

  print('总数：${books.length}');

  final byCategory = <String, int>{};
  for (final b in books) {
    byCategory[b.category] = (byCategory[b.category] ?? 0) + 1;
  }
  print('各类目数量：$byCategory');

  final top3 = [...books]
    ..sort((a, b) => b.borrowCount.compareTo(a.borrowCount));
  print('借阅量 Top3：');
  for (final b in top3.take(3)) {
    print('  $b');
  }
}
