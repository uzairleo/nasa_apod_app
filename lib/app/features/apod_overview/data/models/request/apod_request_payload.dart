import 'package:equatable/equatable.dart';
import 'package:nasa_apod_app/app/core/utilities/json_utils.dart';

class ApodRequestPayload extends Equatable implements JsonConverter {
  final String startDate;
  final String endDate;

  const ApodRequestPayload({
    required this.startDate,
    required this.endDate,
  });

  @override
  ApodRequestPayload fromJson(Map<String, dynamic> json) {
    return ApodRequestPayload(
        startDate: json["start_date"], endDate: json['end_date']);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["start_date"] = startDate;
    data["end_date"] = endDate;
    return data;
  }

  @override
  List<Object?> get props => [startDate, endDate];
}
