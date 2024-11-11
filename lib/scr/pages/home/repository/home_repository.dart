import 'package:greengrocer/scr/constants/constants.dart';
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
      return result['result'];
    } else {
      //error
      return null;
    }
  }
}
