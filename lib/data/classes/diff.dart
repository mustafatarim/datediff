import 'package:json_annotation/json_annotation.dart';

part 'diff.g.dart';

@JsonSerializable()

class Diff {
  final int inYears;
  final int inMonths;
  final int inWeeks;
  final int inDays;
  final int inHours;
  final int inMinutes;
  final int inSeconds;

  Diff(this.inYears, this.inMonths, this.inWeeks, this.inDays, this.inHours,
      this.inMinutes, this.inSeconds);

  factory Diff.fromJson(Map<String, dynamic> json) => _$DiffFromJson(json);

  Map<String, dynamic> toJson() => _$DiffToJson(this);

}
