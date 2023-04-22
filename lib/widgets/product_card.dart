import 'package:e_kart/controllers/product_controller.dart';
import 'package:e_kart/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  ProductCard({super.key, required this.productModel});

  final ProductController _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            elevation: 10,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: ImageHolder(
                  imageUrl: productModel.pImage,
                  width: SizeConfig.screenWidth! * 0.5,
                  height: SizeConfig.screenWidth! * 0.5,
                )),
          ),
          Container(
            color: Colors.transparent,
            width: SizeConfig.screenWidth! * 0.5,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              productModel.pName ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.poppins(
                  color: AppConstants.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.screenWidth! * 0.04),
            ),
          ),
          Container(
            color: Colors.transparent,
            width: SizeConfig.screenWidth! * 0.5,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              '₹ ${productModel.pAmout}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.screenWidth! * 0.035),
            ),
          ),
          InkWell(
            onTap: () => _productController.addToCart(productModel),
            child: Container(
              width: SizeConfig.screenWidth! * 0.5,
              decoration: const BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  'ADD TO CART',
                  style: GoogleFonts.poppins(
                      color: AppConstants.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.screenWidth! * 0.04),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
