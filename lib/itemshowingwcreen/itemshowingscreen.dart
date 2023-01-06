import 'package:adminside/app_module/controller/itemshowingcontroller.dart';
import 'package:adminside/app_module/modelclass/modelclass.dart';
import 'package:adminside/app_module/presentation/user/order.dart';
import 'package:adminside/app_module/presentation/widgetscommon/heading.dart';
import 'package:adminside/app_module/presentation/widgetscommon/scafold_back.dart';
import 'package:adminside/app_module/presentation/widgetscommon/settingscard.dart';
import 'package:adminside/itemshowingwcreen/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemShowingScreen extends StatelessWidget {
  ItemShowingScreen({this.feeds, required this.itemdetail, super.key});
  ModelProduct itemdetail;
  String? feeds;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ItemShowingController>(
          init: ItemShowingController(),
          builder: (c) {
            return SafeArea(
              child: Stack(
                children: [
                  ScafoldBackGroundImage(
                      image:
                          "https://c4.wallpaperflare.com/wallpaper/503/63/644/black-blue-fish-wallpaper-preview.jpg"),
                  const ScafoldBackGroundColor(),
                  ListView(
                    children: [
                      SizedBox(
                        height: 250.h,
                        child: PageView.builder(
                            onPageChanged: (index) {
                              c.itemChanging(index);
                            },
                            itemCount: itemdetail == null
                                ? c.images.length
                                : itemdetail.imagelist!.length,
                            itemBuilder: (context, index) {
                              // currentindex = index;

                              return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(itemdetail == null
                                          ? c.images[index]
                                          : itemdetail.imagelist![index]),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                              );
                            }),
                      ),
                      khieght,
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                                itemdetail == null
                                    ? c.images.length
                                    : itemdetail.imagelist!.length,
                                (
                                  index,
                                ) =>
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 360),
                                        height: 6,
                                        color: c.currentindex == index
                                            ? Colors.grey
                                            : const Color.fromARGB(
                                                255, 8, 41, 69),
                                        width: c.currentindex == index ? 6 : 6,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                      khieght,
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 300.w,
                                  child: TextItemShowName(
                                    title1: itemdetail == null
                                        ? 'oops'
                                        : ' ${itemdetail.name}',
                                  ),
                                ),
                              ],
                            ),
                            khieght,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                PcCard(
                                    itemdetail: itemdetail,
                                    feed: itemdetail.category,
                                    title: itemdetail == null
                                        ? 'oops'
                                        : itemdetail.price.toString()),
                              ],
                            ),
                            khieght,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Pccardadd(
                                    title: itemdetail == null
                                        ? '100'
                                        : itemdetail.category != 'feeds'
                                            ? 'min ${itemdetail.minno.toString()} ps'
                                            : 'min ${itemdetail.minno.toString()} kg'),
                              ],
                            ),
                            khieght,
                            khieght,
                            Column(
                              children: [
                                Card(
                                  color: Colors.white.withOpacity(.1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        GreyText(
                                          title: 'Description',
                                        ),
                                        Text(
                                          itemdetail.description,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                khieght,
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
