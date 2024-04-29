import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cat/models/Transactions.dart';
import 'package:cat/provider/Transaction_provider.dart';

class EditTransactionScreen extends StatefulWidget {
  final Transactions data;

  EditTransactionScreen({required this.data});

  @override
  _EditTransactionScreenState createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  late TextEditingController _titleController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _foodNameController;
  late TextEditingController _nutritionValueController;
  late TextEditingController _genderController; // Add this controller

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.data.title);
    _ageController = TextEditingController(text: widget.data.age.toString());
    _weightController = TextEditingController(text: widget.data.weight.toString());
    _foodNameController = TextEditingController(text: widget.data.foodName);
    _nutritionValueController = TextEditingController(text: widget.data.nutritionValue.toString());
    _genderController = TextEditingController(text: widget.data.gender); // Initialize the controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Cat Profile'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Color(0xFFFAF3D6),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
            ),
            //SizedBox(height: 20.0),
            //TextFormField(
            //  controller: _foodNameController,
            // decoration: InputDecoration(labelText: 'Food Name'),
            //),
            //SizedBox(height: 20.0),
            //TextFormField(
            //  controller: _nutritionValueController,
            //  decoration: InputDecoration(labelText: 'Nutrition Value'),
            // keyboardType: TextInputType.number,
            //),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(labelText: 'Gender'), // Add gender field
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                var updatedData = Transactions(
                  id: widget.data.id,
                  title: _titleController.text,
                  age: int.parse(_ageController.text),
                  weight: double.parse(_weightController.text),
                  //foodName: _foodNameController.text,
                  //nutritionValue: double.parse(_nutritionValueController.text),
                  gender: _genderController.text, // Update gender
                );
                
                Provider.of<TransactionProvider>(context, listen: false).updateTransaction(updatedData);
                
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _foodNameController.dispose();
    _nutritionValueController.dispose();
    _genderController.dispose(); // Dispose the gender controller
    super.dispose();
  }
}
