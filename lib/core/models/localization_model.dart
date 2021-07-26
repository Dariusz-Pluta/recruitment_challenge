import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'localization_model.g.dart';

@HiveType(typeId: 0)
class LocalizationModel extends Equatable {
  @HiveField(0)
  final dynamic id;

  @HiveField(1)
  final String? city;

  @HiveField(2)
  final String? country;

  LocalizationModel({this.id, this.city, this.country});

  factory LocalizationModel.fromJson(Map<String, dynamic> json) {
    return LocalizationModel(
      id: json['id'],
      city: json['locality'] ?? json['name'] ?? 'unknown',
      country: json['country'],
    );
  }

  @override
  String toString() => '$city, $country';

  @override
  List<Object?> get props => [id, city, country];
}
