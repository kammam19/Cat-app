import 'package:cat/screens/cal_food.dart';
import 'package:cat/screens/form_food.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: FoodCat(),
  ));
}

class FoodCat extends StatefulWidget {
  @override
  _FoodCatState createState() => _FoodCatState();
}

class _FoodCatState extends State<FoodCat> {
  TextEditingController weightController = TextEditingController();
  TextEditingController customNutritionController = TextEditingController();

  String foodPerDayResult = '';
  Map<String, dynamic>? selectedFood;
  List<Map<String, dynamic>> foodList = [
    {"name": "PURINA ONE : 1+ years", "nutritionValue": 3.61},
    {"name": "Silver : Indoor", "nutritionValue": 3.0925},
    {"name": "Cat's taste : in gravy", "nutritionValue": 0.45},
    {"name": "Cat's taste : Senior 7+", "nutritionValue": 0.39},
    // Add more food items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        color: Color(0xFFFAF3D6),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              'How much food (g./day) for your cat?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
            DropdownButtonFormField<Map<String, dynamic>>(
  value: selectedFood,
  onChanged: (value) {
    if (customNutritionController.text.trim().isEmpty) {
      setState(() {
        selectedFood = value!;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Warning'),
          content: Text('Please clear the custom nutrition field before selecting a food option.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  },
  items: foodList.map((food) {
    return DropdownMenuItem<Map<String, dynamic>>(
      value: food,
      child: Text(food['name'] as String),
    );
  }).toList(),
  decoration: InputDecoration(labelText: 'Select Food:'),
),

            SizedBox(height: 16),
            TextField(
              controller: customNutritionController,
              keyboardType: TextInputType.number,
              enabled: selectedFood ==
                  null, // ตรวจสอบว่า selectedFood เป็น null หรือไม่
              decoration: InputDecoration(
                labelText: "Please fill in the nutrition (%) here :",
                helperText:
                    "If the recipe you're looking for isn't available in options.",
                contentPadding:
                    EdgeInsets.only(bottom: 8), // Adjust padding here
              ),
            ),

            buildTextField(
              controller: weightController,
              label: 'Weight of Cat (kg.):',
            ),

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    calculateFoodPerDay(isFat: true);
                  },
                  style: ElevatedButton.styleFrom().copyWith(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 147, 79, 2)),
                  ),
                  child: Text(
                    'Fat ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculateFoodPerDay(isFat: false);
                  },
                  style: ElevatedButton.styleFrom().copyWith(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 147, 79, 2)),
                  ),
                  child: Text(
                    'Perfect or Thin',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 254, 254, 254),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "If you don't know shape of cat, you can calculate when you cilck on profile cat.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 235, 221, 255),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                'Food per day for cat is     $foodPerDayResult     g./day',
                style: TextStyle(
                    color: Color.fromARGB(255, 41, 2, 159), fontSize: 18),
              ),
            ),

            SizedBox(height: 80), // Added space

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'If you don`t know the nutrition of food recipes.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalFood()),
                      );
                    },
                    child: Text(
                      'Calculate Nutrition',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 147, 79, 2)),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'To calculate, please click on button.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Save food recipe, please click on button.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FormFood()),
                      );
                    },
                    child: Text(
                      'Save Food Recipe',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 147, 79, 2)),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'To save, please click on button.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
    );
  }

  void calculateFoodPerDay({required bool isFat}) {
    try {
      double weight = double.parse(weightController.text);
      double nutritionValue = 0.0;

      if (selectedFood != null && selectedFood!['nutritionValue'] != null) {
        nutritionValue = selectedFood!['nutritionValue'] as double;
      } else {
        nutritionValue = double.parse(customNutritionController.text);
      }

      double factor = isFat ? 1.2 : 1.4;
      double foodPerDay = factor * (70 * pow(weight, 0.75)) / nutritionValue;

      setState(() {
        foodPerDayResult = foodPerDay.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        foodPerDayResult = 'Invalid input';
      });
    }
  }
}
