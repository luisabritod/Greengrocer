import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/pages.dart';
import 'package:greengrocer/scr/services/services.dart';

class HomeRepository {
  final HttpManager httpManager = HttpManager();

  getAllCategories() async {
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
}
