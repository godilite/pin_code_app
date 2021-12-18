class KeypadPresenter {
  String _input = "";
  String get input => _input;
  List<int> get numbers => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  void insertText(String value) {
    if (_input.isEmpty) {
      _input = value;
    } else {
      _input += value;
    }
  }

  void backspace() {
    if (_input.isEmpty) {
      _input = "";
    } else {
      _input = _input.substring(0, _input.length - 1);
    }
  }

  void clear() {
    _input = '';
  }
}
