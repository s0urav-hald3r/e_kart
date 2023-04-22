import 'package:e_kart/config/routes.dart';
import 'package:e_kart/views/accessory.dart';
import 'package:e_kart/views/laptop.dart';
import 'package:e_kart/views/mobile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_constants.dart';
import '../config/size_configs.dart';
import '../controllers/product_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProductController _productController = Get.find<ProductController>();
  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          centerTitle: true,
          title: const Text('eKart'),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offNamedUntil(Routes.login, (route) => false);
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TabBar(
              isScrollable: false,
              controller: _tabController,
              indicatorColor: AppConstants.primaryColor,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontSize: SizeConfig.screenWidth! * 0.0375,
                  fontWeight: FontWeight.w700),
              unselectedLabelColor: Colors.black45,
              unselectedLabelStyle: TextStyle(
                  color: Colors.black45,
                  letterSpacing: 1,
                  fontSize: SizeConfig.screenWidth! * 0.035,
                  fontWeight: FontWeight.w600),
              labelPadding: const EdgeInsets.only(
                  right: 12.5, left: 12.5, top: 15, bottom: 15),
              // ignore: prefer_const_literals_to_create_immutables
              tabs: const [
                Text(
                  'Mobile',
                ),
                Text(
                  'Laptop',
                ),
                Text(
                  'Accessories',
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                  controller: _tabController,
                  children: [Mobile(), Laptop(), Accessory()]),
            )
          ]),
        ),
        floatingActionButton:
            Obx(() => _productController.totalCartItems.isEqual(0)
                ? const SizedBox()
                : InkWell(
                    onTap: () => Get.toNamed(Routes.cart),
                    child: Container(
                      height: SizeConfig.screenHeight! * 0.05,
                      width: SizeConfig.screenWidth! * 0.915,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
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
                                'CHECKOUT',
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
