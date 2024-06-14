import 'package:nasa_apod_app/app/core/utilities/json_utils.dart';

class Response<T extends JsonConverter> {
  final T data;

  const Response(this.data);

  T fromJson(Map<String, dynamic> json) {
    return data.fromJson(json["data"]);
  }
}
