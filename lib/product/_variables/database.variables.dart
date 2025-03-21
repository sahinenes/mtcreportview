import 'package:hive/hive.dart';

import '../../core/constants/app/app_constants.dart';
import '../../view/machines/model/machines_model.dart';
import '../../view/statitistics/model/statistics_model.dart';


final Box<MachinesModel> machinesBox = Hive.box<MachinesModel>(ApplicationConstants.DATABASE_NAME_MACHINES);
final Box<StatisticsModel> statisticsBox = Hive.box<StatisticsModel>(ApplicationConstants.DATABASE_NAME_STATISTICS);
