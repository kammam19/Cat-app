import 'package:flutter/material.dart';
import 'package:cat/models/Transactions.dart';
import 'package:cat/provider/Transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final weightController = TextEditingController();
  DateTime? selectedDate;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Register Cat'),
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
                decoration: InputDecoration(labelText: "Cat's name"),
                autofocus: true,
                controller: titleController,
                validator: (String? str) {
                  if (str == null || str.isEmpty) {
                    return "Please enter your cat's name.";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Weight (kg.)"),
                controller: weightController,
                keyboardType: TextInputType.number,
                validator: (String? str) {
                  if (str == null || str.isEmpty) {
                    return "Please enter your cat's weight.";
                  }
                  return null;
                },
              ),
              SizedBox(
                  height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                value: selectedGender,
                items: ['male', 'female', 'other']
                    .map((gender) => DropdownMenuItem(
                          child: Text(gender),
                          value: gender,
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your cat\'s gender.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 244, 215, 171)),
                ),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.orange,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  ).then((pickedDate) {
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  });
                },
                child: Row(
                  children: [
                    Text(
                      selectedDate == null
                          ? 'Birthdate'
                          : 'Birthdate: ${selectedDate.toString().substring(0, 10)}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.brown),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.calendar_today,
                        color: Colors.brown),
                  ],
                ),
              ),
              
              SizedBox(
                  height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    var title = titleController.text;
                    var weight = double.parse(weightController.text);
                    var age = DateTime.now().year -
                        selectedDate!.year;

                    Transactions statement = Transactions(
                      title: title,
                      weight: weight,
                      age: age,
                      gender: selectedGender!,
                    );

                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(
                      0xFF795548)),
                ),
                child: Text(
                  "Add Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
