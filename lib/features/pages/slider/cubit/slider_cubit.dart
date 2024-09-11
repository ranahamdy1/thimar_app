import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/pages/slider/cubit/slider_state.dart';
import 'package:thimar_app/features/pages/slider/slider_model.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderState());

  Future<void> getData() async {
    emit(SliderLoadingState());
    try {
      final response = await Dio().get("https://thimar.amr.aait-d.com/api/sliders");
      final model = SliderData.fromJson(response.data);
      emit(SliderSuccessState(list: model.data));
    } catch (error) {
      emit(SliderFailedState(error.toString()));
    }
  }
}
