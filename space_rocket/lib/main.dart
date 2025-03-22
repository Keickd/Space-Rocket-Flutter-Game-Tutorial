import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_rocket/my_game.dart';
import 'package:space_rocket/overlays/game_over_overlay.dart';
import 'package:space_rocket/overlays/title_overlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final MyGame game = MyGame();

  runApp(GameWidget(
    game: game,
    overlayBuilderMap: {
      'GameOver': (context, MyGame game) => GameOverOverlay(game: game),
      'Title': (context, MyGame game) => TitleOverlay(game: game),
    },
    initialActiveOverlays: const ['Title'],
  ));
}
