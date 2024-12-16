import 'package:greengrocer/scr/constants/constants.dart';
import 'package:greengrocer/scr/models/models.dart';
import 'package:greengrocer/scr/pages/pages.dart';
import 'package:greengrocer/scr/services/services.dart';

class OrdersRepository {
  final _httpManager = HttpManager();

  Future<OrdersResult<List<CartItemModel>>> getOrderItems({
    required String orderId,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getOrderItems,
      method: HttpMethods.post,
      body: {
        'order': orderId,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    if (result['result'] != null) {
      List<CartItemModel> items =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();

      return OrdersResult<List<CartItemModel>>.success(items);
    } else {
      return OrdersResult.error('Error');
    }
  }

  Future<OrdersResult<List<OrdersModel>>> getAllOrders({
    required String userId,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.getAllOrders,
        method: HttpMethods.post,
        body: {
          'user': userId,
        },
        headers: {
          'X-Parse-Session-Token': token,
        });

    if (result['result'] != null) {
      List<OrdersModel> orders =
          List<Map<String, dynamic>>.from(result['result'])
              .map(OrdersModel.fromJson)
              .toList();

      return OrdersResult<List<OrdersModel>>.success(orders);
    } else {
      return OrdersResult.error('Error');
    }
  }
}
