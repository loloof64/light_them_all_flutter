import 'package:flutter/material.dart';

const lightOnPath = 'assets/images/light_on.png';
const lightOffPath = 'assets/images/light_off.png';

class LightWidget extends StatelessWidget {
  final bool isOn;
  final void Function() onToggle;

  const LightWidget({
    super.key,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Image.asset(
        isOn ? lightOnPath : lightOffPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
