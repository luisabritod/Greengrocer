import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/pages.dart';
import 'package:greengrocer/scr/services/services.dart';

class HomeRepository {
  final HttpManager httpManager = HttpManager();

  Future<HomeResult<CategoryModels>> getAllCategories() async {
    final result = await httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      //list of categories
      List<CategoryModels> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map((e) => CategoryModels.fromJson(e))
              .toList();

      return HomeResult<CategoryModels>.success(data);
    } else {
      //error
      return HomeResult.error('Failed to get categories');
    }
  }

  Future<HomeResult<ItemModels>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await httpManager.restRequest(
        url: Endpoints.getAllProducts, method: HttpMethods.post, body: body);

    if (result['result'] != null) {
      List<ItemModels> data = List<Map<String, dynamic>>.from(result['result'])
          .map((e) => ItemModels.fromJson(e))
          .toList();
      return HomeResult<ItemModels>.success(data);
    } else {
      return HomeResult.error('Failed to get products');
    }
  }
}
