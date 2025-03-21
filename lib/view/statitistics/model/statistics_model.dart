import 'package:hive/hive.dart';

part 'statistics_model.g.dart';

@HiveType(typeId: 2)
class StatisticsModel {
  @HiveField(0)
  String? uuid;

  @HiveField(1)
  int? ok;

  @HiveField(2)
  int? nok;

  @HiveField(3)
  int? total;

  @HiveField(4)
  String? dataName;

  @HiveField(5)
  String? dataIndex;

  @HiveField(6)
  String? date;

  StatisticsModel({
    this.uuid,
    this.ok,
    this.nok,
    this.total,
    this.dataName,
    this.dataIndex,
    this.date,
  });
}
