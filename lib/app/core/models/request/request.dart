import 'package:nasa_apod_app/app/core/utilities/json_utils.dart';

class Request<T extends JsonConverter> {
  final T data;

  const Request(this.data);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();
    return data;
  }
}
