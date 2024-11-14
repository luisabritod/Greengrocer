import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/home/home.dart';
import 'package:greengrocer/scr/widgets/widgets.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  final searchController = TextEditingController();

  late Function(GlobalKey) runAddToCartAnimation;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Scaffold(
        //app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: TextSpanAppName(
            fontSize: 30,
            color: CustomColors.primaryGreenLight,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
                top: 15,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Badge(
                  backgroundColor: CustomColors.primaryGreen,
                  label: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: AddToCartIcon(
                        key: globalKeyCartItems,
                        icon: const Icon(Icons.shopping_cart)),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: AddToCartAnimation(
          previewCurve: Curves.ease,
          receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
            runAddToCartAnimation = addToCartAnimationMethod;
          },
          gkCart: globalKeyCartItems,
          previewDuration: const Duration(milliseconds: 100),
          child: Column(
            children: [
              //search body
              GetBuilder<HomeController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        controller.searchTitle.value = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: CustomColors.primaryGreen,
                          size: 21,
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                        ),
                        fillColor: Colors.white,
                        suffixIcon: controller.searchTitle.value.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  searchController.clear();
                                  controller.searchTitle.value = '';
                                  FocusScope.of(context).unfocus();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: CustomColors.primaryGreen,
                                  size: 21,
                                ))
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              //categories
              GetBuilder<HomeController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 40,
                      child: !controller.isCategoryLoading
                          ? ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return CategoryTile(
                                  onPressed: () {
                                    controller.selectCategory(
                                        controller.allCategories[index]);
                                  },
                                  category:
                                      controller.allCategories[index].title,
                                  isSelected: controller.allCategories[index] ==
                                      controller.selectedCategory,
                                );
                              },
                              separatorBuilder: (_, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: controller.allCategories.length,
                            )
                          : ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                10,
                                (index) => Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: CustomShimmer(
                                    height: 20,
                                    width: 80,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              //grid

              GetBuilder<HomeController>(
                builder: (controller) {
                  return Expanded(
                    child: !controller.isProductLoading
                        ? Visibility(
                            visible: (controller.selectedCategory?.items ?? [])
                                .isNotEmpty,
                            replacement: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 40,
                                  color: CustomColors.primaryGreen,
                                ),
                                const Text('No products found!'),
                              ],
                            ),
                            child: GridView.builder(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 9 / 11.5,
                                ),
                                itemCount: controller.allProducts.length,
                                itemBuilder: (_, index) {
                                  if (index + 1 ==
                                          controller.allProducts.length &&
                                      !controller.isLastPage) {
                                    controller.loadMoreProducts();
                                  }

                                  return ItemTile(
                                    item: controller.allProducts[index],
                                    cartAnimationMethod:
                                        itemSelectedCartAnimation,
                                  );
                                }),
                          )
                        : GridView.count(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 9 / 11.5,
                            children: List.generate(
                              10,
                              (index) => CustomShimmer(
                                height: double.infinity,
                                width: double.infinity,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
