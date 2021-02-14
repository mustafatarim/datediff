// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diff _$DiffFromJson(Map<String, dynamic> json) {
  return Diff(
    json['inYears'] as int,
    json['inMonths'] as int,
    json['inWeeks'] as int,
    json['inDays'] as int,
    json['inHours'] as int,
    json['inMinutes'] as int,
    json['inSeconds'] as int,
  );
}

Map<String, dynamic> _$DiffToJson(Diff instance) => <String, dynamic>{
      'inYears': instance.inYears,
      'inMonths': instance.inMonths,
      'inWeeks': instance.inWeeks,
      'inDays': instance.inDays,
      'inHours': instance.inHours,
      'inMinutes': instance.inMinutes,
      'inSeconds': instance.inSeconds,
    };
