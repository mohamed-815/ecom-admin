import 'package:adminside/presentation/category/categorylist.dart';
import 'package:adminside/presentation/order.dart';
import 'package:adminside/presentation/prodectside/productadding.dart';
import 'package:adminside/presentation/user/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 75, 17, 85),
          title: Center(child: Text('HOME')),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () =>

                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => AddingScrean(false, null, -1),
                    // ))
                    Get.to(() => Userside()),
                child: Container(
                    height: 200,
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 136, 133, 136)),
                    child: Center(
                        child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Raleway',
                              color: Color.fromARGB(255, 75, 17, 85),
                            ),
                            'Users'))),
              ),
              GestureDetector(
                onTap: () =>

                    //  Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => ListOfAdded()))
                    Get.to(() => CategoryList()),
                child: Container(
                    height: 200,
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 136, 133, 136),
                    ),
                    child: Center(
                        child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: "Font1",
                              color: Color.fromARGB(255, 75, 17, 85),
                            ),
                            'Product side'))),
              ),
              GestureDetector(
                onTap: () =>

                    //  Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => ListOfAdded()))
                    Get.to(() => Order()),
                child: Container(
                    height: 200,
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 136, 133, 136),
                    ),
                    child: Center(
                        child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: "Font1",
                              color: Color.fromARGB(255, 75, 17, 85),
                            ),
                            'Order List'))),
              ),
              GestureDetector(
                // onTap: () =>

                //  Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => ListOfAdded()))
                //   Get.to(() => Order()),
                child: Container(
                    height: 200,
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 136, 133, 136),
                    ),
                    child: Center(
                        child: Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: "Font1",
                              color: Color.fromARGB(255, 75, 17, 85),
                            ),
                            'Offers'))),
              )
            ],
          ),
        ));
  }
}
