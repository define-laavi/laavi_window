import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import './method_channel_laavi_window.dart';
import './window.dart';

export './window.dart';

/// The interface that implementations of laavi_window must implement.
///
/// Platform implementations should extend this class rather than implement it as `laavi_window`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [LaaviWindowPlatform] methods.
abstract class LaaviWindowPlatform extends PlatformInterface {
  /// Constructs a LaaviWindowPlatform.
  LaaviWindowPlatform() : super(token: _token);

  static final Object _token = Object();

  static LaaviWindowPlatform _channelInstance = MethodChannelLaaviWindow();
  static LaaviWindowPlatform _instance = _channelInstance;

  /// The default instance of [LaaviWindowPlatform] to use.
  ///
  /// Defaults to [MethodChannelLaaviWindow].
  static LaaviWindowPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [LaaviWindowPlatform] when they register themselves.
  static set instance(LaaviWindowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void doWhenWindowReady(VoidCallback callback) {
    throw UnimplementedError('doWhenWindowReady() has not been implemented.');
  }

  DesktopWindow get appWindow {
    throw UnimplementedError('appWindow has not been implemented.');
  }

  void dragAppWindow() async {
    _channelInstance.dragAppWindow();
  }
}
