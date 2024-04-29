import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  TextEditingController rController = TextEditingController();
  TextEditingController lController = TextEditingController();
  TextEditingController nutritionController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String bodyShapeResult = '';
  String foodPerDayResult = '';
  String imageUrl = '';
  double nutrition = 0.0;
  double weight = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFAF3D6),
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Shape of Cat'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrrNU90ezusab2ylf2CTjVbdlhWoA0UUjXHG5R_M9n8icTyIYoL7ugMx_2DnDpgZ0JYRk8bwj45n2G4c7mj4DSDdEa-TJORRRVE2anlSoL_oxPXiyllQkelsBrGrHNsE_RytGv5NMyRBz-hKaOI-CpPsN6MQN9yfWgU5ENLr-Zl5MdwkBJUmFE4O7oceiH/w1684-h1069-p-k-no-nu/A8107C2F-495D-4408-B110-8B4195289C77.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_circle_left_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 40,
            color: const Color.fromARGB(231, 77, 11, 11),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Calculate Body Shape of Cat',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.network(
                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg8T-0piFs8_mOXVPwr0_7rmfS-1rknE3XBDq8yNvmNlKI7UHgu2kUJ-7v-w5lSq2LssAi6RnABGhcmSrFa78TCxAxaHpQ3RBHcNTqDj0Jz5fMACrhnM8sczEWEjQ3fR7z_7g4_Zf4AQWu-vHfbUjwn8-7tWd1vhfJXs-Dm-minh6knwhdSEwKmad8iRcr7/s3508/8556CEC9-4735-40F5-9355-0CDDF02D2CD2.gif',
                  height: 250,
                  width: 500,
                ),
                buildTextField(controller: rController, label: 'Chest : (cm.)'),
                SizedBox(height: 16),
                buildTextField(controller: lController, label: 'Leg : (cm.)'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    calculate();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                  ),
                  child: Text('Calculate'),
                ),
                SizedBox(height: 16),
                if (imageUrl.isNotEmpty)
                  Image.network(
                    imageUrl,
                    height: 300,
                    width: 300,
                  ),
              ],
            ),
          ),
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

  void calculate() {
    try {
      double r = double.parse(rController.text);
      double l = double.parse(lController.text);

      double calculatedResult = ((r / 0.7062) - l) / 0.9156 - l;

      setState(() {
        bodyShapeResult = calculatedResult.toString();
        setProfileImage(calculatedResult);
      });
    } catch (e) {
      setState(() {
        imageUrl = '';
      });
    }
  }

  void setProfileImage(double calculatedResult) {
    if (calculatedResult < 15) {
      imageUrl =
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjOrp_BLVIhLMH9TPWEAqqUagJjPDAFeDyE6Q7jad-ONzgvlgHXbO1tXiwwoj_d4sQugexNzyxirDlRzA_OIgKrY_IpjeNPB-il8cUgaZuJzar_oEdqsXMYbgA23u_KNZmj3R4sdRDbG2UtzT9dlUi6z1UvFX4ussGe1ZCxBMLZkb1-JWaztta2N5QPAnB/s320/2DEE3F7F-E831-4A5B-8206-AF123CCEADF4.png';
    } else if (calculatedResult >= 15 && calculatedResult < 29.9) {
      imageUrl =
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgCL0gROofHUJjM-H4eh-8JD4rBy0SwXE8S5bMfCYuZm0Tfu9f25QhziXSdpDhJa_o2gmabwqIdVTNi9-N6zHAnd7R62Kpo6HUqqtYFOujZMA6yYzjnz3i8qo2XBVNe3CgvWVsf23uEvCdMqcDvB5aoZhu8RIYUwmqI7KYINwuepuOsZCj-jD3xsuYVmYp1/s320/14176E22-0B03-449A-A434-030A8DA7A060.png';
    } else if (calculatedResult >= 30) {
      imageUrl =
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhVLbS19049imHbvXUtlXfNeLNv9hHB_QMyK1d51ATxbvBmkh-dwqXZivY1qe9tUFsQhs1TGo7j2G09w7P6ptCL1fHIemqkenCNozPMsOzx76YIyd6V7NIBC-v_r9HGNWmXz1VcBhJn8VN3GGVHsazqketkga0PI50_9RUSHbZYqoGsEg96UiQmTlYUGP9X/s320/2786AE1D-0A3F-4F6D-A8DB-FDCCCB7C47B7.png';
    } else {
      imageUrl = '';
    }
  }
}
