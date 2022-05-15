library laavi_window_windows;

import 'package:flutter/widgets.dart';
import '../platform/laavi_window_platform_interface.dart';
import './window.dart';
import './app_window.dart';
import './native_api.dart';

export './window_interface.dart';

class LaaviWindowWindows extends LaaviWindowPlatform {
  LaaviWindowWindows() : super();

  @override
  void doWhenWindowReady(VoidCallback callback) {
    WidgetsBinding.instance.waitUntilFirstFrameRasterized.then((value) {
      isInsideDoWhenWindowReady = true;
      setWindowCanBeShown(true);
      callback();
      isInsideDoWhenWindowReady = false;
    });
  }

  @override
  DesktopWindow get appWindow {
    return WinAppWindow();
  }
}
