import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/pages/categories/categories_model.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesState());

  Future<void> getCategories() async{
    emit(CategoriesLoadingState());
    final response = await Dio().get("https://thimar.amr.aait-d.com/api/categories");
    final model = CategoriesData.fromJson(response.data);
    emit(CategoriesSuccessState(list: model.data));
  }
}
