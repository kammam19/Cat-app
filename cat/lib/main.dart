import 'package:cat/Cats/Profile_card.dart';
import 'package:cat/models/Transactions.dart';
import 'package:cat/provider/Transaction_provider.dart';
import 'package:cat/screens/EditTransactionScreen.dart';
import 'package:cat/screens/Food.dart';
import 'package:cat/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        title: 'Cat Nutrition',
        theme: ThemeData(),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // สร้างฟังก์ชัน _showGreeting เพื่อแสดง Dialog ของ Instruction
  void _showGreeting() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Instruction"),
          contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 20), // Add padding around content
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Homepage - By clicking on the house icon on the homepage, You can create account your cat by on click icon add person. You can access your cat's account and calculate the shape of your cat."),
              SizedBox(height: 8),
              Text(
                  "Food icon page - You can calculate the amount of food your cat should receive per day (g./day) by entering the nutritional information of the food formula and selecting the shape of the cat for calculation. If you do not know the nutritional information of the food formula, please click the nutritional calculation button below to calculate the amount of food that should be received per day."),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.info),
              onPressed: _showGreeting, // เรียกใช้ฟังก์ชัน _showGreeting เมื่อปุ่ม info ถูกกด
              iconSize: 35,
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj8oITxuOHh6y2B3yHeqDcS7q7zkDjAFNX8ZGRrwhYhwi7DsGhTMb3lD06a9QxVZ7LWHXh5uylV0Nlm3Y9p2WuN1aWCFW787xE8yA3zbdwNZIZqRX7q2I1LDChqTgCx3b1-DWaKWFH8eb4asGIsCfDOnf12Aonj17GwjpfSgWW65YFtLZdLJRQfxaVfYdgb/s3508/468C279B-6EDD-4914-97FA-A8E286F73166.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Container(
          color: Color(0xFFFAF3D6),
          child: TabBarView(
            children: [
              Consumer<TransactionProvider>(
                builder: (context, provider, child) {
                  var transactions = provider.transactions;
                  var count = transactions.length;
                  if (count == 0) {
                    return Center(
                      child: Text("Please create a cat account."),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: count,
                      itemBuilder: (context, int index) {
                        Transactions data = transactions[index];
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 30,
                          ),
                          color: Color(0xFFFAF3D6),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (data.title != null && data.title.isNotEmpty)
                                  Text(
                                    '${data.title.toString()} ',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (data.age != null && data.age != 0)
                                  Text(
                                    'Age: ${data.age.toString()} years',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 111, 9, 130),
                                    ),
                                  ),
                                if (data.weight != null && data.weight != 0.0)
                                  Text(
                                    'Weight: ${data.weight.toString()} kg.',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 111, 9, 130),
                                    ),
                                  ),
                                if (data.gender != null &&
                                    data.gender.isNotEmpty)
                                  Text(
                                    'Gender: ${data.gender}',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 111, 9, 130),
                                    ),
                                  ),
                                if (data.foodName != null &&
                                    data.foodName.isNotEmpty)
                                  Text(
                                    'Food : ${data.foodName}',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 9, 88, 12),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (data.nutritionValue != null &&
                                    data.nutritionValue != 0.0)
                                  Text(
                                    'Nutrition: ${data.nutritionValue.toString()} %',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 9, 88, 12),
                                    ),
                                  ),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor: (data.title != null &&
                                      data.age != null &&
                                      data.age != 0 &&
                                      data.weight != null &&
                                      data.weight != 0.0)
                                  ? Color.fromARGB(255, 216, 122, 250)
                                  : Colors.green,
                              child: Image.network(
                                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiqGdgHQfHnx_4jqHgtwIHVgTHWeR4W-9-AwgOuwDuaGGVZaMVmWmwCal9S8zYZPBf_vHkwVn7lD6jrvnF20tfpsYeYGNU_IMHBmC9R9dCEgf3v9mDUO-YLd_u9PZAotF2biyM1SqKLesLLSrqmhGtqmYO2Vn7z2LxVMf-H5CNrkdP-N75hcIwuKtLriaxK/w1684-h1069-p-k-no-nu/2350965C-B25F-4DEB-8FC3-8F634D5E52CD.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfileCard();
                              }));
                            },
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () async {
                                final updatedData = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditTransactionScreen(data: data),
                                  ),
                                );
                                if (updatedData != null) {
                                  provider.updateTransaction(updatedData);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              FoodCat(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormScreen();
            }));
          },
          backgroundColor: Colors.orange,
          elevation: 50,
          child: Image.network(
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1YloZbvZi_bcS9V_AAEIHddrJdYRDa5tZlmXKbwJQadvAkwCeEbfNrKrd64C8_8qNXyD7x_VElNYUPQBhyphenhyphen0nPsF8qyU8qR5mSyczhlnVrIC-UZg9kxqdr_6znHyyh_S_ZuKx3tXnRsSF6v1qQ4FnAe3cjN01N39coevp8RVI3YqxpvjhGSv0qIu_HHTsL/s320/872B90B1-6954-4944-ACFE-296A6F2F7A1D.png',
            width: 50,
            height: 50,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
            padding: EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home, size: 28, color: Colors.brown),
                ),
                Tab(
                  icon: Icon(Icons.restaurant, size: 28, color: Colors.brown),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
