import 'package:adminside/user/prodectside/modelclass.dart';
import 'package:adminside/user/prodectside/productadding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class InSideCategory extends StatelessWidget {
  const InSideCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 45, 43),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 15, 89),
        title: Text('Items List'),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => AddProduct()),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(.1),
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            )),
          )
        ],
      ),
      body: StreamBuilder(
          stream: showTheList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('some thing went wrong');
            }

            if (snapshot.hasData) {
              final showingitems = snapshot.data!;
              return ListView(
                children: showingitems
                    .map((e) => MyWidget(
                          item: e,
                          id: e.id,
                        ))
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // ListView.builder(
            //     itemCount: products.length,
            //     itemBuilder: (context, index) {
            //       final item = products[index];
            //       return MyWidget(item: item);
            //     }

            //     //  MyWidget(item: products)

            //     )
          }),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({required this.item, required this.id, super.key});
  ModelProduct item;
  String id;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  await tapeToedit(id);
                  Get.to(() => AddProduct(
                        editproduct: editproduct,
                      ));
                },
                child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.2),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  await tapeToDelete(id);
                },
                child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.2),
                    child: Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(item.imagelist?[0].toString() == null
                          //     ||
                          // item.imagelist![1].toString() == null
                          ? 'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg'
                          : item.imagelist![1].toString()),
                    ),
                  ),
                )
                // : Image.asset(
                //     height: 150,
                //     width: 150,
                //     'assets/goldfish1-2.webp',
                //     fit: BoxFit.cover,
                //   ),,
                ,
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //   ListTile(
                    //   trailing: CircleAvatar(
                    //       backgroundColor: Colors.white.withOpacity(.2),
                    //       child: Icon(Icons.delete)),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Item Name : ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Item Price :',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          item.price,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Item Size : ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          item.size,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Min Nos: ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          item.minno,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'description : ',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: 40,
                          child: Text(
                            item.description,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //    Model(description: description, image: image, minno: minno, price: price, size: size)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> tapeToDelete(id) {
  return FirebaseFirestore.instance.collection('category').doc(id).delete();
}

Future<ModelProduct> tapeToedit(id) async {
  final editingthing =
      FirebaseFirestore.instance.collection('category').doc(id);

  final snapshot = await editingthing.get();

  return editproduct = ModelProduct.fromJson(snapshot.data()!);
}

ModelProduct editproduct = ModelProduct(
    description: '', name: '', category: '', minno: '', price: '', size: '');
