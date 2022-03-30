// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'],
      list: json['list'] as List<dynamic>?,
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'message': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('list', instance.list);
  return val;
}
