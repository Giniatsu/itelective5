import 'Screens.dart';

abstract class MyScreenManager {
  static int currentScreen = 0;

  static Screens getScreen(int i) {
    switch (i) {
      case 0:
        return Screens.Home;
      case 1:
        return Screens.AboutUs;
      default:
        return Screens.Home;
    }
  }

  static Screens getCurrentScreen() {
    return getScreen(currentScreen);
  }

  static setCurrentScreen(Screens s) {
    switch (s) {
      case Screens.Home:
        currentScreen = 0;
        break;
      case Screens.AboutUs:
        currentScreen = 1;
        break;
      default:
        currentScreen = 0;
    }
  }

}