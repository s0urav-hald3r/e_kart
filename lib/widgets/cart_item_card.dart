import 'package:e_kart/models/product.dart';
import 'package:e_kart/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';
import '../controllers/product_controller.dart';

class CartItemCard extends StatelessWidget {
  final ProductModel productModel;
  CartItemCard({Key? key, required this.productModel}) : super(key: key);

  final ProductController _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                elevation: 10,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: ImageHolder(
                      imageUrl: productModel.pImage,
                      width: SizeConfig.screenWidth! * 0.3,
                      height: SizeConfig.screenWidth! * 0.3,
                    )),
              ),
              Container(
                width: SizeConfig.screenWidth! * 0.595,
                height: SizeConfig.screenWidth! * 0.3,
                padding: const EdgeInsets.all(10),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productModel.pName ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                          color: AppConstants.blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.screenWidth! * 0.04),
                    ),
                    Text(
                      '₹ ${productModel.pAmout}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.screenWidth! * 0.035),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () =>
                              _productController.removeFromCart(productModel),
                          child: Container(
                            width: SizeConfig.screenWidth! * 0.25,
                            decoration: BoxDecoration(
                              color: AppConstants.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Center(
                              child: Text(
                                'REMOVE',
                                style: GoogleFonts.poppins(
                                    color: AppConstants.blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: SizeConfig.screenWidth! * 0.035),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]));
  }
}
