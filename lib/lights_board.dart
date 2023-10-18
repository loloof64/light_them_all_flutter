import 'package:flutter/material.dart';
import 'package:light_them_all/light.dart';
import 'package:light_them_all/light_board_data.dart';

const singleLightSizePx = 120.0;

class LightBoardWidget extends StatelessWidget {
  final LightBoardData boardData;
  final void Function(int row, int col) onToggle;

  const LightBoardWidget({
    super.key,
    required this.boardData,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    var lightsComps = <Widget>[];
    for (var row = 0; row < boardData.lightsPerSide; row++) {
      var line = <Widget>[];
      for (var col = 0; col < boardData.lightsPerSide; col++) {
        line.add(
          SizedBox(
            width: singleLightSizePx,
            height: singleLightSizePx,
            child: LightWidget(
              isOn: boardData.lightStateAt(row, col),
              onToggle: () => onToggle(row, col),
            ),
          ),
        );
      }
      lightsComps.add(
        Row(
          children: line,
        ),
      );
    }

    return Center(
      child: Column(children: lightsComps),
    );
  }
}
