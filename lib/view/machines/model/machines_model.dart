import 'package:hive/hive.dart';

part 'machines_model.g.dart';

@HiveType(typeId: 1)
class MachinesModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? location;

  @HiveField(2)
  String? date;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? uuid;

  @HiveField(5)
  String? imageUrl;

  @HiveField(6)
  String? code;

  MachinesModel({
    this.name,
    this.location,
    this.date,
    this.url,
    this.uuid,
    this.imageUrl,
    this.code
  });
}
