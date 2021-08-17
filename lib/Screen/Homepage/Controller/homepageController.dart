import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashlob_app/Constant/constant.dart';
import 'package:hashlob_app/Model/model.dart';
import 'package:hashlob_app/Networking/api.dart';
import 'package:hive/hive.dart';

class HomePageController extends GetxController with WidgetsBindingObserver {
  List<Datum>? detailList = [];
  RxBool isLoading = true.obs;
  RxList<bool>? isChecked;
  // List<CartModel> cartList = [];
  RxDouble? totalAmount = 0.0.obs;
  late Box<Datum> dataBox;

  @override
  void onInit() {
    WidgetsBinding.instance!.addObserver(this);
    getDetailList();
    super.onInit();
  }

  void getDetailList() async {
    dataBox = Hive.box<Datum>(hiveBoxName);
    ApiIntegration apiIntegration = ApiIntegration();

//! Check Hive Box
    if (dataBox.isEmpty) {
      final apiresponse = await apiIntegration.fetchDetail();

      if (apiresponse.response.statusCode == 200) {
        print('Stauts Code Ok');
        detailList = apiIntegration.detail;
        isLoading.value = false;
        isChecked = RxList<bool>.filled(detailList!.length, false);
        print(detailList![0].name);
        detailList!.forEach((element) {
          dataBox.add(element);
        });

        print('Data get From Api----------------------------');
      }
    } else {
      List<int> keys = dataBox.keys.cast<int>().toList();
      for (int i = 0; i < keys.length; i++) {
        final int key = keys[i];
        final Datum? categ = dataBox.get(key);
        detailList?.add(categ!);
      }
      isChecked = RxList<bool>.filled(keys.length, false);
      isLoading.value = false;
      print('Already have Data');
    }
  }

  updatecheckBox(val, index) {
    print('Coming Value $val');
    isChecked![index] = val!;
    update();
  }

  updatetotal(totalprice) {
    totalAmount!.value = totalprice;
    update();
    print('total');
  }
}
