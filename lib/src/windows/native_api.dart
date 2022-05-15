library laavi_window_windows;

import 'dart:ffi';

final DynamicLibrary _appExecutable = DynamicLibrary.executable();

// isLaaviWindowLoaded
typedef Int8 TIsLaaviWindowLoaded();
typedef DTIsLaaviWindowLoaded = int Function();
final DTIsLaaviWindowLoaded? _isLaaviWindowLoaded =
    _publicAPI.ref.isLaaviWindowLoaded.asFunction();

bool isLaaviWindowLoaded() {
  if (_isLaaviWindowLoaded == null) {
    return false;
  }
  return _isLaaviWindowLoaded!() == 1 ? true : false;
}

// getAppWindow
typedef IntPtr TGetAppWindow();
typedef DGetAppWindow = int Function();
final DGetAppWindow getAppWindow = _publicAPI.ref.getAppWindow.asFunction();

// setWindowCanBeShown
typedef Void TSetWindowCanBeShown(Int8 value);
typedef DSetWindowCanBeShown = void Function(int value);
final DSetWindowCanBeShown _setWindowCanBeShown =
    _publicAPI.ref.setWindowCanBeShown.asFunction();
void setWindowCanBeShown(bool value) => _setWindowCanBeShown(value ? 1 : 0);

// setMinSize
typedef Void TSetMinSize(Int32 width, Int32 height);
typedef DSetMinSize = void Function(int width, int height);
final DSetMinSize setMinSize = _publicAPI.ref.setMinSize.asFunction();

// setMaxSize
typedef Void TSetMaxSize(Int32 width, Int32 height);
typedef DSetMaxSize = void Function(int width, int height);
final DSetMinSize setMaxSize = _publicAPI.ref.setMaxSize.asFunction();

// setWindowCutOnMaximize
typedef Void TSetWindowCutOnMaximize(Int32 width);
typedef DSetWindowCutOnMaximize = void Function(int width);
final DSetWindowCutOnMaximize setWindowCutOnMaximize =
    _publicAPI.ref.setWindowCutOnMaximize.asFunction();

class LWPublicAPI extends Struct {
  external Pointer<NativeFunction<TIsLaaviWindowLoaded>> isLaaviWindowLoaded;
  external Pointer<NativeFunction<TGetAppWindow>> getAppWindow;
  external Pointer<NativeFunction<TSetWindowCanBeShown>> setWindowCanBeShown;
  external Pointer<NativeFunction<TSetMinSize>> setMinSize;
  external Pointer<NativeFunction<TSetMaxSize>> setMaxSize;
  external Pointer<NativeFunction<TSetWindowCutOnMaximize>>
      setWindowCutOnMaximize;
}

class LWAPI extends Struct {
  external Pointer<LWPublicAPI> publicAPI;
}

typedef Pointer<LWAPI> TLaaviWindowAPI();

final TLaaviWindowAPI laaviWindowAPI = _appExecutable
    .lookup<NativeFunction<TLaaviWindowAPI>>("laavi_window_api")
    .asFunction();

final Pointer<LWPublicAPI> _publicAPI = laaviWindowAPI().ref.publicAPI;
