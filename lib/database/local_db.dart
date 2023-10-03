import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';

//generic class for Hive storage
class OfflineDatabase {
  final String dbName;

  OfflineDatabase({required this.dbName});

  Future addData<E>(E data) async {
    await Hive.box<E>(dbName).add(data);
  }

  Future retrieveData<E>() async {
    final dataList = await Hive.box<E>(dbName);

    if (dataList.isNotEmpty) {
      return dataList.values;
    }
  }

  Future updateData<E>(E data, int index) async {
    await Hive.box<E>(dbName).putAt(index, data);
  }

  Future deleteData<E>(E data) async {
    await Hive.box<E>(dbName).keys.map((e) async =>
        await Hive.box<E>(dbName).get(e) == data
            ? await Hive.box<E>(dbName).delete(e)
            : print(""));
  }
}
