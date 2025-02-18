import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:space_rocket/components/asteroid.dart';
import 'package:space_rocket/my_game.dart';

class Shield extends SpriteComponent
    with HasGameReference<MyGame>, CollisionCallbacks {
  Shield() : super(size: Vector2.all(200), anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('shield.png');

    position += game.player.size / 2;

    add(CircleHitbox());

    final ScaleEffect pulsatingEffect = ScaleEffect.to(
      Vector2.all(1.1),
      EffectController(
          duration: 0.6,
          alternate: true,
          infinite: true,
          curve: Curves.easeInOut),
    );

    add(pulsatingEffect);

    final OpacityEffect fadeOutEffect = OpacityEffect.fadeOut(
      EffectController(
        duration: 2.0,
        startDelay: 3.0,
      ),
      onComplete: () {
        removeFromParent();
        game.player.activeShield = null;
      },
    );

    add(fadeOutEffect);

    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Asteroid) {
      other.takeDamage();
    }
  }
}
