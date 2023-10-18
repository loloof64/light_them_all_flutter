import 'dart:math';

class LightBoardData {
  final int lightsPerSide;
  final Random _random = Random();
  var _lights = [[]];

  LightBoardData(this.lightsPerSide) {
    _scramble(12);
  }

  bool lightStateAt(int row, int col) => _lights[row][col];

  bool get isWon {
    bool result = true;
    for (var line in _lights) {
      for (var value in line) {
        if (value == false) {
          result = false;
          break;
        }
      }
    }
    return result;
  }

  void toggle(int row, int col) {
    _lights[row][col] = !_lights[row][col];
    if (row > 0) {
      _lights[row - 1][col] = !_lights[row - 1][col];
    }
    if (row < lightsPerSide - 1) {
      _lights[row + 1][col] = !_lights[row + 1][col];
    }
    if (col > 0) {
      _lights[row][col - 1] = !_lights[row][col - 1];
    }
    if (col < lightsPerSide - 1) {
      _lights[row][col + 1] = !_lights[row][col + 1];
    }
  }

  _scramble(int steps) {
    _clear();
    for (int i = 0; i < steps; i++) {
      final row = _random.nextInt(lightsPerSide);
      final col = _random.nextInt(lightsPerSide);
      toggle(row, col);
    }
  }

  _clear() {
    _lights = List.generate(
      lightsPerSide,
      (index) => List.generate(
        lightsPerSide,
        (index) => false,
      ),
    );
  }
}
