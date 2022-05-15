import 'package:flutter/services.dart';

import 'laavi_window_platform_interface.dart';

const MethodChannel _channel = MethodChannel('laavi/window');

/// An implementation of [LaaviWindowPlatform] that uses method channels.
class MethodChannelLaaviWindow extends LaaviWindowPlatform {
  @override
  void dragAppWindow() async {
    try {
      await _channel.invokeMethod('dragAppWindow');
    } catch (e) {
      print("Could not start draggging -> $e");
    }
  }
}
