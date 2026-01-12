class Setting {
  bool _fullScreen;
  bool _hideStatusBar;
  bool _hideNavigatorBar;

  Setting({
    bool fullScreen = false,
    bool hideStatusBar = false,
    bool hideNavigatorBar = false,
  }) : _fullScreen = fullScreen,
       _hideStatusBar = hideStatusBar,
       _hideNavigatorBar = hideNavigatorBar;

  bool get hideNavigatorBar => _hideNavigatorBar;

  set hideNavigatorBar(bool value) {
    _hideNavigatorBar = value;
  }

  bool get hideStatusBar => _hideStatusBar;

  set hideStatusBar(bool value) {
    _hideStatusBar = value;
  }

  bool get fullScreen => _fullScreen;

  set fullScreen(bool value) {
    _fullScreen = value;
  }
}
