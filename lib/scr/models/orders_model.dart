// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:greengrocer/scr/models/models.dart';

class OrdersModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrdersModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
