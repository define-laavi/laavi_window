import 'dart:ffi';
import 'package:win32/win32.dart';
import 'package:ffi/ffi.dart';

const WM_LW_ACTION = 0x7FFE;

const LW_SETWINDOWPOS = 1;
const LW_SETWINDOWTEXT = 2;
const LW_FORCECHILDREFRESH = 3;

class SWPParam extends Struct {
  @Int32()
  external int x, y, cx, cy, uFlags;
}

void setWindowPos(
    int hWnd, int hWndInsertAfter, int x, int y, int cx, int cy, int uFlags) {
  final param = calloc<SWPParam>();
  param.ref
    ..x = x
    ..y = y
    ..cx = cx
    ..cy = cy
    ..uFlags = uFlags;
  PostMessage(hWnd, WM_LW_ACTION, LW_SETWINDOWPOS, param.address);
}

class SWTParam extends Struct {
  external Pointer<Utf16> text;
}

void setWindowText(int hWnd, String text) {
  final param = calloc<SWTParam>();
  param.ref.text = text.toNativeUtf16();
  PostMessage(hWnd, WM_LW_ACTION, LW_SETWINDOWTEXT, param.address);
}

void forceChildRefresh(int hWnd) {
  PostMessage(hWnd, WM_LW_ACTION, LW_FORCECHILDREFRESH, 0);
}
