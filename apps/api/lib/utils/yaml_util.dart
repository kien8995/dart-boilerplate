import 'package:yaml/yaml.dart';

dynamic convertYaml(dynamic value) {
  if (value is YamlMap) {
    return value.cast<String, dynamic>().map(
        (String k, dynamic v) => MapEntry<String, dynamic>(k, convertYaml(v)));
  }
  if (value is YamlList) {
    return value.map((dynamic e) => convertYaml(e)).toList();
  }
  return value;
}

Map<String, dynamic>? loadYamlAsMap(dynamic value) {
  final YamlMap? yamlMap = loadYaml(value) as YamlMap?;
  return convertYaml(yamlMap).cast<String, dynamic>();
}
