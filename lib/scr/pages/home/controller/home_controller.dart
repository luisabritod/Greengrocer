import 'package:get/get.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/home/home.dart';
import 'package:greengrocer/scr/services/services.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isCategoryLoading = false;
  bool isProductLoading = false;
  List<CategoryModels> allCategories = [];
  CategoryModels? selectedCategory;
  List<ItemModels> get allProducts => selectedCategory?.items ?? [];

  RxString searchTitle = ''.obs;

  bool get isLastPage {
    if (selectedCategory!.items.length < itemsPerPage) return true;
    return selectedCategory!.pagination * itemsPerPage > allProducts.length;
  }

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();

    debounce(searchTitle, (_) {
      update();
    }, time: const Duration(milliseconds: 600));

    getAllCategories();
  }

  selectCategory(CategoryModels category) {
    selectedCategory = category;
    update();

    if (selectedCategory!.items.isNotEmpty) return;

    getAllProducts();
  }

  loadMoreProducts() {
    selectedCategory!.pagination++;
    getAllProducts(canLoad: false);
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModels> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        if (allCategories.isEmpty) return;

        selectedCategory = allCategories.first;

        print('All Categories: $allCategories');
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> getAllProducts({bool canLoad = true}) async {
    if (canLoad) {
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      "page": selectedCategory!.pagination,
      "categoryId": selectedCategory!.id,
      "itemsPerPage": itemsPerPage,
    };

    HomeResult<ItemModels> homeResult =
        await homeRepository.getAllProducts(body);

    setLoading(false, isProduct: true);

    homeResult.when(
      success: (data) {
        selectedCategory!.items.addAll(data);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
