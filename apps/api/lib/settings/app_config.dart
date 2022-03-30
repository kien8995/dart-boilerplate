import 'package:json_annotation/json_annotation.dart';
import 'package:yaml/yaml.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  AppConfig({required this.host});

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  final String host;

  AppConfig parseYaml(String str) {
    final dynamic yaml = loadYaml(str);
    return AppConfig.fromJson(yaml);
  }
}
