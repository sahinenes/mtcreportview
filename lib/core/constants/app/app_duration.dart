
class DurationManager {
  DurationManager._init();
  static DurationManager? _instance;
  static DurationManager get instance {
    _instance ??= DurationManager._init();
    return _instance!;
  }

  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}
