import 'package:flutter/material.dart';

class MEfoods extends StatefulWidget {
  @override
  _MEfoodsState createState() => _MEfoodsState();
}

class _MEfoodsState extends State<MEfoods> {
  TextEditingController kcalController = TextEditingController();
  TextEditingController feedController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Calculation ME'),
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
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgMJppDD_eJQJlTWvx1qVhDQ_S-byE_6xXVMiSvAU6kctv7s1JHqAkzKTxSy1Eg0DVIABXPWTJ1Ol2v9nAhKxfBdQTeYXCEnHepAhRe7UG8ylBMcDIcRsc6pEba09SERCTLpOxa4LCWXf-xwIolXhQP2uqFB3NmH_U1FUc4O8zCw-72fOAv4v9ZwjZKzLFt/s320/%E0%B8%A3%E0%B8%B9%E0%B8%9B4.jpg',
                height: 300,
                width: 500,
              ),
              Text(
                  "Please fill in the information by looking at the cat food label."),

              // Text inputs and calculation button
              buildNumberTextField(
                labelText: 'Kcal (Kcal.)',
                controller: kcalController,
              ),
              buildNumberTextField(
                labelText: 'Feed (g.)',
                controller: feedController,
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (kcalController.text.isEmpty ||
                      feedController.text.isEmpty) {
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
                      double kcal = double.parse(kcalController.text);
                      double feed = double.parse(feedController.text);

                      if (feed == 0.0) {
                        // Show error message if feed is zero
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Feed value must be greater than zero.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        result = (kcal / feed).toStringAsFixed(2);
                      }
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
                      horizontal: 150, vertical: 20)), // ปรับขนาดของปุ่ม
                ),
              ),

              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 235, 221, 255),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical:
                        20), // เพิ่มค่า vertical เพื่อเพิ่มขนาดแนวนอนของช่องผลลัพธ์
                child: Text(
                  'Nutrition of food recipes:  $result%',
                  style: TextStyle(fontSize: 17 ,color: Color.fromARGB(255, 41, 2, 159),),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAF3D6), // Set background color of the screen
    );
  }

  void calculate() {
    // Implement your calculation logic here
  }

  Widget buildNumberTextField({
    required String labelText,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
