import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/services/services.dart';

class CartRepository {
  final _httpManager = HttpManager();

  Future getCartItems({required String token, required String userId}) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.getCartItems,
        method: HttpMethods.post,
        headers: {'X-Parse-Session-Token': token},
        body: {'userId': userId});

    if (result['result'] != null) {
      print('cart:' + result['result']);
    } else {
      print('Error');
    }
  }
}
