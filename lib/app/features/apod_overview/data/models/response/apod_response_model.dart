import 'package:equatable/equatable.dart';
import 'package:nasa_apod_app/app/core/utilities/json_utils.dart';

class ApodResponseModel extends Equatable implements JsonConverter {
  final List<Apod> apods;

  const ApodResponseModel({
    required this.apods,
  });

  factory ApodResponseModel.fromJson(List<dynamic> json) {
    List<Apod> apodList = json.map((i) => Apod.fromJson(i)).toList();
    return ApodResponseModel(apods: apodList);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apods'] = apods.map((apod) => apod.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [];

  @override
  fromJson(Map<String, dynamic> json) {
    return ApodResponseModel.fromJson(const []);
  }
}

class Apod {
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;

  Apod({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  Apod.fromJson(json) {
    date = json['date'];
    explanation = json['explanation'];
    hdurl = json['hdurl'];
    mediaType = json['media_type'];
    serviceVersion = json['service_version'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['explanation'] = explanation;
    data['hdurl'] = hdurl;
    data['media_type'] = mediaType;
    data['service_version'] = serviceVersion;
    data['title'] = title;
    data['url'] = url;
    return data;
  }
}
