import 'dart:async';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';

class MyGame extends FlameGame {

  @override
  FutureOr<void> onLoad() async {
    await Flame.device.fullScreen();
    await Flame.device.setPortrait();

    return super.onLoad();
  }


}