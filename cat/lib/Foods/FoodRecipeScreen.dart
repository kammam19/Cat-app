import 'package:flutter/material.dart';
import 'package:cat/models/Transactions.dart';

class FoodRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: 5, // แทนที่ด้วยจำนวนรายการที่คุณต้องการแสดง
        itemBuilder: (context, int index) {
          Transactions data = Transactions(
          ); // สร้างอ็อบเจกต์ Transaction ดัมการนำมาใช้เป็นตัวอย่าง
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            color: Color(0xFFFAF3D6),
            child: ListTile(
              title: Text(
                data.foodName,
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Nutrition: ${data.nutritionValue.toString()} %',
                style: TextStyle(
                  color: Colors.brown,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
