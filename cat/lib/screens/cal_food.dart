import 'package:cat/Foods/GA_foods.dart';
import 'package:cat/Foods/ME_foods.dart';
import 'package:flutter/material.dart';

class CalFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
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
          color: Color(0xFFFAF3D6), // Set background color to orange
          child: Column(
            children: [
              Text(
                'Calculate Nutrition of Foods',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown, // Set text color to dark brown
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Please check the food label if it has metabolizable energy information like the one in the green box.",
                style: TextStyle(
                  color: Colors.brown, // Set text color to dark brown
                ),
              ),
              SizedBox(height: 30),
              Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEggx8OorqUsZrH-G4cwJ-mcl9_Hzv381ECp7cwuy-qZWP-hgvv1nq8wooGCbGwYRQhzGOT1bTjZ7lhotnV7yPAvKnMMKm_P1YRogu-omOkrNj2_O6Cr-TqLgwdnpXqibrcrz_lIwaSA_V_02-8D5ZiCX65p18hncnwGVRsH0NP5-CfCn83IkOSL72aY-ntY/w1684-h1069-p-k-no-nu/%E0%B8%A3%E0%B8%B9%E0%B8%9B1.jpg',
                height: 300,
                width: 500,
              ),
              SizedBox(height: 10),
              Text(
                "In the case there's metabolizable energy information shown on the label, use calculation ME.",
                style: TextStyle(
                  color: Colors.brown, // Set text color to dark brown
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MEfoods()),
                  );
                },
                child: Text(
                  'Calculation ME',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 254, 254), // Set text color to black
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 147, 79, 2), // Set background color to orange
                  ),
                ),
              ),
              SizedBox(height: 40),
              Image.network(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhQnJsQ01IuPElTWVFwziV7AjTXw8bvMamwr6NTMCXsXW8l6GD5Rpr9RdvLtw1eurTtVMTyR4i7-qbEMf88R669BcMkr9JjKFKRPpV0yfE_3SWM4xYcO80yG2Mex8g_y4h1nOj-VbC_Re3Lt-sUV0stcY_1JYt9sOYdm7UaNaMvF8rTTSzFlRLfNmRx20Nt/w1684-h1069-p-k-no-nu/%E0%B8%A3%E0%B8%B9%E0%B8%9B2.jpg',
                height: 300,
                width: 500,
              ),
              SizedBox(height: 10),
              Text(
                "In the case the label does not specify this information, look for the Guaranteed analysis information like the one in the red box to use in calculation GA.",
                style: TextStyle(
                  color: Colors.brown, // Set text color to dark brown
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GAfoods()),
                  );
                },
                child: Text(
                  'Calculation GA',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 254, 254), // Set text color to black
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 147, 79, 2), // Set background color to orange
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
