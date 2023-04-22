import 'package:e_kart/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/size_configs.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';

class Laptop extends StatelessWidget {
  Laptop({Key? key}) : super(key: key);

  final ProductController _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
          key: key,
          shrinkWrap: true,
          padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
              bottom: _productController.totalCartItems.isEqual(0)
                  ? SizeConfig.safeAreaBottom! + 15
                  : SizeConfig.safeAreaBottom! +
                      15 +
                      SizeConfig.screenHeight! * 0.06),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.54,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          itemBuilder: (context, i) {
            return ProductCard(
              productModel: laptopProducts[i],
            );
          },
          itemCount: laptopProducts.length,
        ));
  }
}
