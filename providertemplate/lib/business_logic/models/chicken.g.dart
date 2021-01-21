// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chicken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chicken _$ChickenFromJson(Map<String, dynamic> json) {
  return Chicken(
    name: json['name'] as String,
    age: json['age'] as int,
  );
}

Map<String, dynamic> _$ChickenToJson(Chicken instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };
