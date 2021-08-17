import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashlob_app/Constant/constantWidgets.dart';
import 'package:hashlob_app/Model/CartModel.dart';
import 'package:hashlob_app/Model/model.dart';
import 'package:hashlob_app/Screen/CartScreen/Controller/cartController.dart';
import 'package:hashlob_app/Screen/Homepage/Controller/homepageController.dart';

class Searching extends SearchDelegate<Datum> {
  List<Datum> items;
  Searching(this.items);

  final homePageController = Get.find<HomePageController>();
  final cartController = Get.find<CartContoller>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Get.back();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist = query.isEmpty
        ? items
        : items
            .where((p) => p.name!.toUpperCase().startsWith(query.toUpperCase()))
            .toList();

    return searchlist.isEmpty
        ? Padding(
            padding: EdgeInsets.only(left: 70, top: 25),
            child: Text(
              'No item Found',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          )
        : ListView.builder(
            itemCount: searchlist.length,
            itemBuilder: (BuildContext context, int index) {
              var searched = searchlist[index];
              return checkBox(searched.name, searched.price, index, CartModel(
                                searched.name,
                                1,
                                searched.price,
                              ));
            });
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
