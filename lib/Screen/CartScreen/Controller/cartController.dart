import 'package:get/get.dart';
import 'package:hashlob_app/Model/CartModel.dart';

class CartContoller extends GetxController {
  RxBool isLoading = true.obs;
  List<CartModel> cartList = [];
  RxInt? totalAmount = 0.obs;

  RxInt inc = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  updateTimeandAmount() {
    totalAmount!.value = 0;
    cartList.forEach((element) {
      totalAmount!.value = totalAmount!.value + int.parse(element.price!);
      print(totalAmount!.value);
    });
    update();
  }

  //!
  RxList<CartModel> itemsList = <CartModel>[].obs;

  RxDouble totalprice = 0.0.obs;



  void addProduct(CartModel items) {
    int index = itemsList.indexWhere((i) => i.name == items.name);
    print(index);
    if (index != -1)
      updateProduct(items, items.quantity! + 1);
    else {
      itemsList.add(items);
      calculateTotal();
      update();
      print('Add');
    }
  }

  void removeProduct(product) {
    int index = itemsList.indexWhere((i) => i.name == product.name);
    itemsList[index].quantity = 1;
    itemsList.removeWhere((item) => item.name == product.name);
    calculateTotal();
    update();
  }

  void updateProduct(product, qty) {
    int index = itemsList.indexWhere((i) => i.name == product.name);
    itemsList[index].quantity = qty;
    if (itemsList[index].quantity == 0) removeProduct(product);
    update();
    calculateTotal();
    itemsList.refresh();
  }

  void clearCart() {
    itemsList.forEach((f) => f.quantity = 1);
    itemsList.value = [];
    update();
  }

  void calculateTotal() {
    totalprice.value = 0.0;
    itemsList.forEach((f) {
      totalprice.value += int.parse(f.price!) * f.quantity!;
    });
    update();
  }
}
