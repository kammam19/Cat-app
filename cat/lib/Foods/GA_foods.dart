import 'package:flutter/material.dart';

class GAfoods extends StatefulWidget {
  @override
  _GAfoodsState createState() => _GAfoodsState();
}

class _GAfoodsState extends State<GAfoods> {
  double proteinValue = 0.0;
  double fatValue = 0.0;
  double fiberValue = 0.0;
  double moistureValue = 0.0;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Calculation GA'),
        // Place the Container with DecorationImage here
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjgUWDrFQjC7zyEl2D0q-Ng-RDYbhbjRPN8PYogvNpzermj3JsCzTczFryvgx022boce8G1E7XVPXZlFLPIqdXPPSqxU_ptDX8RWFSswiMaOo_77jByMRYIwi44ofA2g1f17pO8Gd6sw8p6pQnrSVxore3q37q3Zoz2_5lIjumOZCCyrnYN5J2zM8uI-uYQ/w1684-h1069-p-k-no-nu/75131769-6C7A-4E00-96B7-A489E87A33B5.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjvptEGt9a-UHSWhtpPqbZDrf7qA_HHVJxOV8p74hND-Djo0D4fgWkP6k6fI3CU3q1Za1bOJAC_IxOPv1AhpJNA7XxYV_2VOuKRcnDk01qyFotFSfXWsBvfOAdf7i3A9f4hyB5RxqYJgCf2LVpDj_OqhuJsUSi9IPcZSL47XQzDsbJBYaUuc8c1aNIDjWTB/s320/%E0%B8%A3%E0%B8%B9%E0%B8%9B3.jpg',
                height: 250,
                width: 500,
              ),
              SizedBox(height: 20),
              buildNumberTextField(
                labelText: 'Protein (% min) :',
                onChanged: (value) {
                  setState(() {
                    proteinValue = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              buildNumberTextField(
                labelText: 'Fat (% min) :',
                onChanged: (value) {
                  setState(() {
                    fatValue = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              buildNumberTextField(
                labelText: 'Fiber (% max) :',
                onChanged: (value) {
                  setState(() {
                    fiberValue = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              buildNumberTextField(
                labelText: 'Moisture (% max) :',
                onChanged: (value) {
                  setState(() {
                    moistureValue = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (proteinValue == 0.0 ||
                      fatValue == 0.0 ||
                      fiberValue == 0.0 ||
                      moistureValue == 0.0) {
                    // Show error message if any field is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter the amount of nutrients.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    // Perform calculation if all fields are filled
                    setState(() {
                      result = ((proteinValue * 3.5) +
                              (fatValue * 8.5) +
                              ((100 -
                                      proteinValue -
                                      fatValue -
                                      fiberValue -
                                      moistureValue) *
                                  3.5)) /
                          100;
                    });
                  }
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white, // กำหนดสีของตัวอักษรเป็นสีขาว
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 147, 79, 2)),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20)), // ปรับขนาดของปุ่ม
                ),
              ),
              SizedBox(height: 20),
              Container(
                color:
                    Color.fromARGB(255, 235, 221, 255), // กำหนดสีพื้นหลังให้กับ Container เป็นสีขาว
                padding: EdgeInsets.all(16), // เพิ่มระยะห่างภายใน Container
                child: Center(
                  child: Text(
                    proteinValue == 0.0 ||
                            fatValue == 0.0 ||
                            fiberValue == 0.0 ||
                            moistureValue == 0.0
                        ? 'Nutrition of food recipes:     %'
                        : 'Nutrition of food recipes:     $result %',
                    
                  style: TextStyle(fontSize: 18 ,color: Color.fromARGB(255, 41, 2, 159),),
                  ),
                ),
              ),
            ],
          ),
        ), // Set background color of the screen
      ),
      backgroundColor: Color(0xFFFAF3D6),
    );
  }

  Widget buildNumberTextField({
    required String labelText,
    required void Function(String) onChanged,
  }) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: labelText),
      onChanged: onChanged,
    );
  }
}
