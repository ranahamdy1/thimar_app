import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/features/auth/login/bloc.dart';

void initKiwi() {
  final container = KiwiContainer();
  container.registerFactory((container) => LoginBloc());
}