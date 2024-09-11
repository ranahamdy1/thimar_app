
import 'package:thimar_app/features/pages/categories/categories_model.dart';

class CategoriesState {}
class CategoriesLoadingState extends CategoriesState {}
class CategoriesSuccessState extends CategoriesState {
  final List<CategoriesModel>? list;
  CategoriesSuccessState({required this.list});
}
class CategoriesFailedState extends CategoriesState {}
