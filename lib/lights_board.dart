import 'package:flutter/material.dart';
import 'package:light_them_all/light.dart';

class LightBoardWidget extends StatefulWidget {
  const LightBoardWidget({super.key});

  @override
  State<LightBoardWidget> createState() => _LightBoardWidgetState();
}

class _LightBoardWidgetState extends State<LightBoardWidget> {
  List<bool> lights = [true];

  void _onToggle() {
    setState(() {
      lights[0] = ! lights[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: LightWidget(
          isOn: lights[0],
          onToggle: _onToggle,
        ),
      ),
    );
  }
}
