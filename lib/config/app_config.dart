enum RunMode {
  debug,
  release,
}

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  RunMode _runMode;
  get isDebug => _runMode == RunMode.debug;

  AppConfig._internal();

  factory AppConfig() {
    if (_instance._runMode == null) {
      _instance._runMode = const bool.fromEnvironment('dart.vm.product')
          ? RunMode.release
          : RunMode.debug;
    }

    return _instance;
  }
}
