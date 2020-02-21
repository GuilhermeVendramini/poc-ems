import 'package:ems/app/repositories/hive/hive_events/hive_events_repository.dart';

class HiveEventsInstance {
  HiveEventsInstance._();

  static final HiveEventsRepository repository = HiveEventsRepository();
}
