import 'package:equatable/equatable.dart';
import 'package:nasa_apod_app/app/core/utilities/json_utils.dart';

class ApodRequestPayload extends Equatable implements JsonConverter {
  final String count;

  const ApodRequestPayload({
    required this.count,
  });

  @override
  ApodRequestPayload fromJson(Map<String, dynamic> json) {
    return ApodRequestPayload(
      count: json["count"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    return data;
  }

  @override
  List<Object?> get props => [
        count,
      ];
}
