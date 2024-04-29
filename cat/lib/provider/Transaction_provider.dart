import 'package:cat/database/Transaction_db.dart';
import 'package:cat/models/Transactions.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransactions() {
    return transactions;
  }



  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }
  
  Future<void> addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.insertData(statement); // แก้เป็น insertData แทน InsertData
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void updateTransaction(Transactions updatedData) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.updateTransaction(updatedData);
    transactions = await db.loadAllData();
    notifyListeners();
  }

  Future<void> removeTransaction(String id) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.deleteData(id); // แก้เป็น deleteData แทน deleteData
    transactions.removeWhere((transaction) => transaction.id == id);
    notifyListeners();
  }
}