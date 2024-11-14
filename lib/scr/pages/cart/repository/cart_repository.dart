import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/cart/cart.dart';
import 'package:greengrocer/scr/services/services.dart';

class CartRepository {
  final _httpManager = HttpManager();

  Future<CartResult<List<CartItemModel>>> getCartItems(
      {required String token, required String userId}) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.getCartItems,
        method: HttpMethods.post,
        headers: {'X-Parse-Session-Token': token},
        body: {'userId': userId});

    if (result['result'] != null) {
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map((e) => CartItemModel.fromJson(e))
              .toList();

      return CartResult<List<CartItemModel>>.sucess(data);
    } else {
      return CartResult.error('Error');
    }
  }
}
