import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:minifantasy/light.dart';
import 'package:minifantasy/main.dart';
import 'package:minifantasy/orc.dart';
import 'package:minifantasy/player.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      tileSize = constraints.maxHeight / 40;
      return BonfireTiledWidget(
        joystick: Joystick(directional: JoystickDirectional(), actions: [
          JoystickAction(
            actionId: 1,
            margin: const EdgeInsets.all(65),
          )
        ]),
        player: HumanPlayer(Position(4 * tileSize, 4 * tileSize)),
        map: TiledWorldMap('tile/map.json', forceTileSize: tileSize)
          ..registerObject(
            'light',
            (x, y, width, height) => Light(Position(x, y), width, height),
          )
          ..registerObject('orc', (x, y, width, height) => Orc(Position(x, y))),
        lightingColorGame: Colors.black.withOpacity(0.65),
      );
    });
  }
}
