import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarController extends GetxController {
  // Initial app bar height
  var appBarHeight = 340.0.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    appBarHeight.value = (340.0 - scrollController.offset).clamp(120.0, 340.0);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
