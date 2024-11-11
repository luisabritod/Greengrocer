import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_result.freezed.dart';

@freezed
class HomeResult<T> with _$HomeResult {
  factory HomeResult.success(List<T> data) = HomeSuccess;
  factory HomeResult.error(String message) = HomeError;
}
