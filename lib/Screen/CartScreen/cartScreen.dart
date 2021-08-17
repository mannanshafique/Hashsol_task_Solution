import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashlob_app/Constant/constantWidgets.dart';

import 'Controller/cartController.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final cartContoller = Get.find<CartContoller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets().appBar('Cart Screen',[]),
      bottomNavigationBar: Obx(
        () => CommonWidgets()
            .bottomButton('Total', cartContoller.totalprice.toString(), () {}),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Obx(() => (cartContoller.itemsList.length == 0)
            ? Center(
                child: Text(
                  'No Item in Cart',
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            : ListView.builder(
                itemCount: cartContoller.itemsList.length,
                itemBuilder: (context, index) {
                  // var items = providerCart.basketItems[index];
                  var items = cartContoller.itemsList[index];
                  return ListTile(
                     
                      title: Text('${items.name}'),
                      subtitle: Text(items.quantity.toString() +
                          " x " +
                          '${items.price.toString()} \$' +
                          " = " +
                          ('${items.quantity! * int.parse(items.price!)} \$')
                              .toString()),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            increButton(Icons.add, () {
                              cartContoller.updateProduct(
                                  items, items.quantity! + 1);
                            }),
                            increButton(Icons.remove, () {
                              cartContoller.updateProduct(
                                  items, items.quantity! - 1);
                            }),
                            increButton(Icons.delete, () {
                              cartContoller.removeProduct(items);
                            }),
                          ],
                        ),
                      ));
                }),)
      ),
    );
  }

  Widget cartListTile(title, trailing, subtitle) {
    return ListTile(
      title: Text(title),
      trailing: Text('quantity = ${subtitle.toString()}'),
      subtitle: Text('\$ ${trailing.toString()}'),
    );
  }

  Widget increButton(IconData iconData, function) {
    return Card(
      shape: StadiumBorder(),
      elevation: 4,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          splashColor: Colors.transparent,
          icon: Icon(iconData),
          onPressed: function,
        ),
      ),
    );
  }
}
