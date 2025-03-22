import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class AudioManager extends Component {
  bool musicEnabled = true;
  bool soundEnabled = true;

  @override
  FutureOr<void> onLoad() async {
    FlameAudio.bgm.initialize();

    await FlameAudio.audioCache.loadAll([
      'music.ogg',
      'click.ogg',
      'collect.ogg',
      'explode1.ogg',
      'explode2.ogg',
      'fire.ogg',
      'hit.ogg',
      'laser.ogg',
      'start.ogg',
    ]);

    return super.onLoad();
  }

  void playMusic() {
    if (musicEnabled) {
      FlameAudio.bgm.play(
        'music.ogg',
        volume: 0.5,
      );
    }
  }

  void playSound(String sound) {
    if (soundEnabled) {
      FlameAudio.play('$sound.ogg', volume: 1);
    }
  }

  void toggleMusic() {
    musicEnabled = !musicEnabled;
    if (musicEnabled) {
      playMusic();
    } else {
      FlameAudio.bgm.stop();
    }
  }

  void toggleAudio() {
    soundEnabled = !soundEnabled;
  }
}
