import 'package:reio/reio.dart';

// If this is your first time using Reio, it is highly
// it is highly recommended that you open the documentation of the framework.
// https://github.com/MineEjo/reiodart/wiki

class App extends ReioWidget {
  App(super.construct, super.styles);

  @override
  void activity() {}
}

ReioWidget app = App((inThis) => Div('Test'), null);