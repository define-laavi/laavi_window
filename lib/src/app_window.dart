import './platform/laavi_window_platform_interface.dart';
import './platform/method_channel_laavi_window.dart';
import './windows/laavi_window_windows_real.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

bool _platformInstanceNeedsInit = true;

void initPlatformInstance() {
  if (!kIsWeb) {
    if (LaaviWindowPlatform.instance is MethodChannelLaaviWindow) {
      if (Platform.isWindows) {
        LaaviWindowPlatform.instance = LaaviWindowWindows();
      }
    }
  }
}

LaaviWindowPlatform get _platform {
  var needsInit = _platformInstanceNeedsInit;
  if (needsInit) {
    initPlatformInstance();
    _platformInstanceNeedsInit = false;
  }
  return LaaviWindowPlatform.instance;
}

void doWhenWindowReady(VoidCallback callback) {
  _platform.doWhenWindowReady(callback);
}

DesktopWindow get appWindow => _platform.appWindow;

class MoveWindow extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onDoubleTap;
  MoveWindow({Key? key, this.child, this.onDoubleTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (child == null) return _MoveWindow(onDoubleTap: this.onDoubleTap);
    return _MoveWindow(
      onDoubleTap: this.onDoubleTap,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Expanded(child: this.child!)]),
    );
  }
}

class _MoveWindow extends StatelessWidget {
  _MoveWindow({Key? key, this.child, this.onDoubleTap}) : super(key: key);
  final Widget? child;
  final VoidCallback? onDoubleTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanStart: (details) {
          appWindow.startDragging();
        },
        onDoubleTap: this.onDoubleTap ?? () => appWindow.maximizeOrRestore(),
        child: this.child ?? Container());
  }
}

class WindowTitleBarBox extends StatelessWidget {
  final Widget? child;
  WindowTitleBarBox({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container();
    }
    final titlebarHeight = appWindow.titleBarHeight;
    return SizedBox(height: titlebarHeight, child: this.child ?? Container());
  }
}
