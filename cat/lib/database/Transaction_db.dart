import 'dart:io';
import 'package:cat/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  late String dbName;

  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertData(Transactions statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.add(db, {
      "title": statement.title,
      "weight": statement.weight,
      "age": statement.age,
      "foodName": statement.foodName,
      "nutritionValue": statement.nutritionValue,
      "gender": statement.gender,
      "fd": statement.fd, // Use "food" field
      "nutri": statement.nutri, // Use "nutrition" field
    });
    await db.close();
    return keyID;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);
    List<Transactions> transactionList = [];
   for (var record in snapshot) {
  if (record["weight"] != null &&
      record["nutritionValue"] != null &&
      record["gender"] != null &&
      record["age"] != null && // Add this line
      record["foodName"] != null && // Add this line
      record["fd"] != null && // Add this line
      record["nutri"] != null // Add this line
      ) {
    int? age = record["age"] as int?;
    transactionList.add(
      Transactions(
        id: record.key,
        title: record["title"] as String,
        weight: record["weight"] as double,
        age: age ?? 0,
        foodName: record["foodName"] as String,
        nutritionValue: record["nutritionValue"] as double,
        gender: record["gender"] as String,
        fd: record["fd"] as String,
        nutri: record["nutri"] as double,
      ),
    );
  }
}

    await db.close();
    return transactionList;
  }

  Future<void> updateTransaction(Transactions updatedData) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    await store.record(updatedData.id).update(db, {
      "title": updatedData.title,
      "age": updatedData.age,
      "weight": updatedData.weight,
      "foodName": updatedData.foodName,
      "nutritionValue": updatedData.nutritionValue,
      "gender": updatedData.gender,
      "fd": updatedData.fd, // Use "food" field
      "nutri": updatedData.nutri, // Use "nutrition" field
    });
    await db.close();
  }

  Future<void> deleteData(String id) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    await store.record(int.parse(id)).delete(db); // Parse id to int
    await db.close();
  }
}
