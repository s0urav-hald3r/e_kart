import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';
import '../controllers/product_controller.dart';
import '../widgets/cart_item_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ProductController _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          centerTitle: true,
          title: const Text('Cart'),
        ),
        body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 10,
                bottom: SizeConfig.safeAreaBottom! +
                    10 +
                    SizeConfig.screenHeight! * 0.06),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _productController.cartItems
                    .map((e) => CartItemCard(productModel: e))
                    .toList()),
          ),
        ),
        floatingActionButton: _productController.totalCartItems.isEqual(0)
            ? const SizedBox()
            : InkWell(
                onTap: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.zero,
                          child: Container(
                            width: SizeConfig.screenWidth! * 0.9,
                            height: SizeConfig.screenHeight! * 0.175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your order has been placed successfully.',
                                    style: GoogleFonts.inter(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            SizeConfig.screenWidth! * 0.045),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            _productController.placeOrder(),
                                        child: Container(
                                          width: SizeConfig.screenWidth! * 0.15,
                                          height:
                                              SizeConfig.screenHeight! * 0.04,
                                          decoration: BoxDecoration(
                                              color: AppConstants.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: Text(
                                              'OK',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      SizeConfig.screenWidth! *
                                                          0.03),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                child: Container(
                  height: SizeConfig.screenHeight! * 0.05,
                  width: SizeConfig.screenWidth! * 0.915,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppConstants.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${_productController.totalCartItems} Items',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                                fontSize: SizeConfig.screenWidth! * 0.0375),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: VerticalDivider(
                              width: 10,
                              thickness: 2,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '₹ ${_productController.totalCartValue}',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                                fontSize: SizeConfig.screenWidth! * 0.0375),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'DONE',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                                fontSize: SizeConfig.screenWidth! * 0.04),
                          ),
                          const Gap(10),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )));
  }
}
