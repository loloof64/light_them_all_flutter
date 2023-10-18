import 'package:flutter/material.dart';
import 'package:light_them_all/light.dart';

const singleLightSizePx = 120.0;

class LightBoardWidget extends StatefulWidget {
  const LightBoardWidget({super.key});

  @override
  State<LightBoardWidget> createState() => _LightBoardWidgetState();
}

class _LightBoardWidgetState extends State<LightBoardWidget> {
  final lightsPerSide = 4;
  var lights = [[]];

  @override
  void initState() {
    lights = List.generate(
      lightsPerSide,
      (index) => List.generate(
        lightsPerSide,
        (index) => false,
      ),
    );
    super.initState();
  }

  void _onToggle(int row, int col) {
    setState(() {
      lights[row][col] = !lights[row][col];
      if (row > 0) {
        lights[row-1][col] = !lights[row-1][col];
      }
      if (row < lightsPerSide - 1) {
        lights[row+1][col] = !lights[row+1][col];
      }
      if (col > 0) {
        lights[row][col-1] = !lights[row][col-1];
      }
      if (col < lightsPerSide - 1) {
        lights[row][col+1] = !lights[row][col+1];
      }
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
              isOn: lights[row][col],
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
