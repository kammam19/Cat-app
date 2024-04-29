import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cat/provider/Transaction_provider.dart';
import 'package:cat/models/Transactions.dart';

class FormFood extends StatefulWidget {
  @override
  _FormFoodState createState() => _FormFoodState();
}

class _FormFoodState extends State<FormFood> {
  final formKey = GlobalKey<FormState>();

  final foodNameController = TextEditingController();
  final nutritionValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Register Food Recipe'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhvmTybHR9ftRzBGk4U_7p0ZH6Nx384pSukrGk2V_9kTMxigTfT0mvXU9vlBsjuCY6T6aQadWPfzSVevflkLAuaHh0JxgO9sNSAVl9exEzp4znMMBAwmVsVu_RhMiVWTkUXWsjhy_rJDDKCAmgAI3iFQitzkiwIstJ0cDSz7OFfXSWTOAZQrKr24_kWIsJk/w1684-h1069-p-k-no-nu/5807C3FC-07B2-4005-A56F-5D2A9B8986EB.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Food's name"),
                autofocus: true,
                controller: foodNameController,
                validator: (String? str) {
                  if (str == null || str.isEmpty) {
                    return "Please enter your Food's name.";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Nutrition (%)"),
                controller: nutritionValueController,
                keyboardType: TextInputType.number,
                validator: (String? str) {
                  if (str == null || str.isEmpty) {
                    return "Please enter Nutrition.";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ), // Add spacing between date picker and add profile button
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    var foodName = foodNameController.text;
                    var nutritionValue =
                        double.parse(nutritionValueController.text);

                    Transactions statement = Transactions(
                      foodName: foodName,
                      nutritionValue: nutritionValue,
                    );

                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.pop(context); // กลับไปยังหน้ารายการอาหาร
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xFF795548)), // Set button background color to brown
                ),
                child: Text(
                  "Add Food Recipe",
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18, // Set text size to 18
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAF3D6),
    );
  }
}
