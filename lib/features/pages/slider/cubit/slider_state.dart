
import 'package:thimar_app/features/pages/slider/slider_model.dart';

class SliderState {}

class SliderLoadingState extends SliderState {}

class SliderSuccessState extends SliderState {
  final List<SliderModel>? list;
  SliderSuccessState({ required this.list});
}

class SliderFailedState extends SliderState {
  final String error;
  SliderFailedState(this.error);
}
