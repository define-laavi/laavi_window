library laavi_window_windows;

import './native_api.dart';
import './window.dart';

const notInitializedMessage = """
 laavi_window is not initalized.  
 """;

class LaaviNotInitializedException implements Exception {
  String errMsg() => notInitializedMessage;
}

class WinAppWindow extends WinWindow {
  WinAppWindow._() {
    super.handle = getAppWindow();
    final isLoaded = isLaaviWindowLoaded();
    if (!isLoaded) {
      print(notInitializedMessage);
      throw LaaviNotInitializedException;
    }
    assert(handle != null, "Could not get Flutter window");
  }

  static final WinAppWindow _instance = WinAppWindow._();

  factory WinAppWindow() {
    return _instance;
  }
}
