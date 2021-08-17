import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashlob_app/Constant/constantWidgets.dart';
import 'package:hashlob_app/Model/CartModel.dart';
import 'package:hashlob_app/Model/model.dart';
import 'package:hashlob_app/Screen/CartScreen/Controller/cartController.dart';
import 'package:hashlob_app/Screen/CartScreen/cartScreen.dart';
import 'package:hashlob_app/Screen/Homepage/Controller/homepageController.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'Search/searching.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homePageController = Get.put(HomePageController());
  final cartController = Get.put(CartContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets().appBar('HomePage',[
         IconButton(onPressed: (){
              showSearch(
                  context: context,
                  delegate: Searching(homePageController.detailList!)); }
            , icon: Icon(Icons.search))
      ]),
      bottomNavigationBar: Obx(
        () => CommonWidgets().bottomButton(
            'Go to Cart', homePageController.totalAmount.toString(), () {
          Get.to(() => CartScreen());

          print(homePageController.isChecked);
          homePageController.totalAmount!.value = 0.0;
        }),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: homePageController.dataBox.listenable(),
              builder: (context, Box<Datum> boxData, _) {
                List<int> keys = boxData.keys.cast<int>().toList();
                print('In');
                print(keys.length);
                return (homePageController.isLoading.value)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final int key = keys[index];
                          final Datum? categ = boxData.get(key);
                          // var datalist = homePageController.detailList![index];
                          return checkBox(
                              categ!.name,
                              categ.price,
                              index,
                              CartModel(
                                categ.name,
                                1,
                                categ.price,
                              ));
                        });
              })),
    );
  }

  Widget checkBox(name, price, index, list) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(
          () => CheckboxListTile(
            //dense: true,
            activeColor: Colors.blue,
            controlAffinity: ListTileControlAffinity.platform,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CommonWidgets()
                  .text(name, 16.0, Colors.black, FontWeight.w600, 1),
            ),

            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: Colors.white,

            subtitle: Row(
              children: [
                CommonWidgets()
                    .text('\$ $price', 16.0, Colors.black, FontWeight.w600, 1),
                SizedBox(
                  width: 30,
                ),
              ],
            ),

            value: homePageController.isChecked?[index],

            onChanged: (val) {
              print('sss$val');
              homePageController.updatecheckBox(val, index);

              if (val == true) {
                cartController.addProduct(list);
                cartController.updateProduct(list, 1);
              } else if (val == false) {
                cartController.removeProduct(list);
              }
              homePageController.updatetotal(cartController.totalprice.value);
              print(cartController.totalprice.value);
            },
          ),
        ));
  }
}


//  Obx(() => (homePageController.isLoading.value)
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     var datalist = homePageController.detailList![index];
//                     return checkBox(
//                         datalist.name,
//                         datalist.price,
//                         index,
//                         CartModel(
//                           datalist.name,
//                           1,
//                           datalist.price,
//                         ));
//                   })
//                   )