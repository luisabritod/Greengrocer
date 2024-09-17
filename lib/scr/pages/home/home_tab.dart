import 'package:flutter/material.dart';
import 'package:greengrocer/scr/config/config.dart';
import 'package:greengrocer/scr/pages/home/components/components.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Fruits';

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
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            //search body
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 20,
              ),
              child: TextFormField(
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            //categories
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      onPressed: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      category: categories[index],
                      isSelected: categories[index] == selectedCategory,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: categories.length,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //grid
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5,
                  ),
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return ItemTile(
                      item: items[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
