import 'package:flutter/material.dart';
import 'package:light_them_all/light.dart';
import 'package:light_them_all/light_board_data.dart';

const singleLightSizePx = 120.0;

class LightBoardWidget extends StatefulWidget {
  const LightBoardWidget({super.key});

  @override
  State<LightBoardWidget> createState() => _LightBoardWidgetState();
}

class _LightBoardWidgetState extends State<LightBoardWidget> {
  final lightsPerSide = 4;
  LightBoardData? _boardData;

  @override
  void initState() {
    _boardData = LightBoardData(lightsPerSide);
    super.initState();
  }

  void _onToggle(int row, int col) {
    setState(() {
      _boardData?.toggle(row, col);
    });
  }

  @override
  Widget build(BuildContext context) {
    var lightsComps = <Widget>[];
    for (var row = 0; row < lightsPerSide; row++) {
      var line = <Widget>[];
      for (var col = 0; col < lightsPerSide; col++) {
        line.add(
          SizedBox(
            width: singleLightSizePx,
            height: singleLightSizePx,
            child: LightWidget(
              isOn: _boardData?.lightStateAt(row, col) ?? false,
              onToggle: () => _onToggle(row, col),
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
